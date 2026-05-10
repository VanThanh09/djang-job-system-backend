import random
from pathlib import Path
from typing import Any

import numpy as np
import io
from sentence_transformers import SentenceTransformer
from googletrans import Translator
from PyPDF2 import PdfReader
from sklearn.metrics.pairwise import cosine_similarity
from jinja2 import Template

from .models import CandidateVector, PostingVector

# model & translate
model = SentenceTransformer("TechWolf/JobBERT-v2")
translator = Translator()


def ndarray_to_bytes(arr: np.ndarray) -> bytes:
    buf = io.BytesIO()
    np.save(buf, arr)
    return buf.getvalue()


def bytes_to_ndarray(b: bytes) -> np.ndarray:
    buf = io.BytesIO(b)
    return np.load(buf, allow_pickle=False)


def translate_to_en(text: str) -> str:
    if not text.strip():
        return ""
    try:
        return translator.translate(text, src="auto", dest="en").text
    except Exception:
        return text


def extract_text_from_pdf(path: str) -> str:
    reader = PdfReader(path)
    text = ""
    for page in reader.pages:
        text += page.extract_text() or ""
    return text


def embed_and_save_candidate(candidate, cv):
    if not cv:
        return
    text = extract_text_from_pdf(cv)
    text_en = translate_to_en(text)
    vec = model.encode([text_en], normalize_embeddings=True)[0]
    CandidateVector.objects.update_or_create(
        candidate=candidate,
        defaults={"dim": len(vec), "vector": ndarray_to_bytes(vec)}
    )

    print("embedding done")


def embed_and_save_posting(posting):
    text = posting.title + " " + posting.description
    text_en = translate_to_en(text)
    vec = model.encode([text_en], normalize_embeddings=True)[0]
    PostingVector.objects.update_or_create(
        posting=posting,
        defaults={"dim": len(vec), "vector": ndarray_to_bytes(vec)}
    )

    print("embedding done")


def recommend_candidates_for_job(posting, threshold):
    try:
        post_vec_obj = PostingVector.objects.get(posting=posting)
    except Exception:
        return []

    job_vec = bytes_to_ndarray(post_vec_obj.vector)
    results = []
    for cand_vec in CandidateVector.objects.select_related("candidate").all():
        cv_vec = bytes_to_ndarray(cand_vec.vector)
        score = cosine_similarity([cv_vec], [job_vec])[0][0]
        if score >= threshold:
            results.append((cand_vec.candidate, score))

    results.sort(key=lambda x: x[1], reverse=True)
    return results


def recommend_jobs_for_candidate(candidate, threshold):
    try:
        candidate_vec_obj = CandidateVector.objects.get(candidate=candidate)
    except Exception:
        return []

    cand_vec = bytes_to_ndarray(candidate_vec_obj.vector)
    results = []
    for pos_vec_obj in PostingVector.objects.select_related("posting").all():
        pos_vec = bytes_to_ndarray(pos_vec_obj.vector)
        score = cosine_similarity([pos_vec], [cand_vec])[0][0]

        if score >= threshold:
            results.append((pos_vec_obj.posting, score))

    results.sort(key=lambda x: x[1], reverse=True)
    return results

from django.utils.http import urlsafe_base64_encode
from django.utils.encoding import force_bytes
from django.contrib.auth.tokens import default_token_generator

def generate_verify_token(user):
    uid = urlsafe_base64_encode(force_bytes(user.pk))
    token = default_token_generator.make_token(user)
    return uid, token

from django.core.mail import send_mail

def send_verify_email(user):
    uid, token = generate_verify_token(user)

    verify_link = f"{settings.FRONTEND_URL}/verify-email?uid={uid}&token={token}"

    message = f"""
    Kính gửi Quý khách,

    Cảm ơn Quý khách đã đăng ký tài khoản với chúng tôi.

    Để hoàn tất quá trình đăng ký, vui lòng nhấp vào liên kết dưới đây để xác minh địa chỉ email của Quý khách:
    {verify_link}

    Nếu Quý khách không thực hiện yêu cầu này, vui lòng bỏ qua email này.

    Trân trọng,
    Đội ngũ hỗ trợ
    """

    send_mail(
        "Xác minh tài khoản của bạn",
        message,
        "no-reply@gmail.com",
        [user.email],
    )

BASE_DIR = Path(__file__).parent / "email-templates" / "build"

def render_email_template(*, template_name: str, context: dict[str, Any]) -> str:
    template_path = BASE_DIR / template_name

    template_str =template_path.read_text(encoding="utf-8")
    html_content = Template(template_str).render(context)

    return html_content


import requests
from django.conf import settings

def create_daily_room(room_name=None):
    url = f"{settings.DAILY_BASE_URL}/rooms"

    headers = {
        "Authorization": f"Bearer {settings.DAILY_API_KEY}",
        "Content-Type": "application/json"
    }

    payload = {
        "name": room_name,  # optional (Daily sẽ tự random nếu không có)
        "privacy": "public",  # hoặc "private"
        "properties": {
            "enable_chat": True,
            "enable_screenshare": True,
            "start_video_off": False,
            "start_audio_off": False
        }
    }

    response = requests.post(url, json=payload, headers=headers)

    if response.status_code != 200:
        raise Exception(f"Daily API error: {response.text}")

    return response.json()
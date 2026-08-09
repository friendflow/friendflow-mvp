from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel

from live_feed import fetch_live_feed
from payment_handler import process_vip_payment
from user_filtering import filter_users_by_interest


app = FastAPI(
    title="FriendFlow API",
    description="Backend API for the FriendFlow application",
    version="1.0.0",
)


# -------------------------
# CORS
# -------------------------

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


# -------------------------
# Temporary users
# -------------------------

users = []


# -------------------------
# Request models
# -------------------------

class SignupRequest(BaseModel):
    full_name: str
    email: str
    password: str
    marital_status: str


class FilterRequest(BaseModel):
    interest: str


class VipPaymentRequest(BaseModel):
    user_id: str
    plan: str


# -------------------------
# Health check
# -------------------------

@app.get("/")
def root():
    return {
        "success": True,
        "message": "FriendFlow API is running",
    }


# -------------------------
# Signup
# -------------------------

@app.post("/signup")
def signup(data: SignupRequest):
    user = {
        "id": len(users) + 1,
        "full_name": data.full_name,
        "email": data.email,
        "password": data.password,
        "marital_status": data.marital_status,
        "interests": [],
    }

    users.append(user)

    return {
        "success": True,
        "message": "Account created successfully",
        "user": {
            "id": user["id"],
            "full_name": user["full_name"],
            "email": user["email"],
            "marital_status": user["marital_status"],
        },
    }


# -------------------------
# Live Feed
# -------------------------

@app.get("/live-feed")
def live_feed():
    return {
        "success": True,
        "videos": fetch_live_feed(),
    }


# -------------------------
# User Filtering
# -------------------------

@app.post("/users/filter")
def filter_users(data: FilterRequest):
    matching_users = filter_users_by_interest(
        users,
        data.interest,
    )

    return {
        "success": True,
        "users": matching_users,
    }


# -------------------------
# VIP Payment
# -------------------------

@app.post("/vip/payment")
def vip_payment(data: VipPaymentRequest):
    process_vip_payment(
        data.user_id,
        data.plan,
    )

    return {
        "success": True,
        "message": "VIP payment request received",
        "user_id": data.user_id,
        "plan": data.plan,
    }

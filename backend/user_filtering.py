def filter_users_by_interest(users, interest):
    return [user for user in users if interest in user['interests']]
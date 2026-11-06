def is_adult(age):
    """Return whether age is at least 18. Reject negative ages."""
    if age < 0:
        raise ValueError("Age cannot be negative.")
    return age >= 18

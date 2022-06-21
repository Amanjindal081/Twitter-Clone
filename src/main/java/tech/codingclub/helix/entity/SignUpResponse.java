package tech.codingclub.helix.entity;

public class SignUpResponse {
    public String message;
    public Boolean user_created;

    public SignUpResponse(String message, Boolean user_created) {
        this.message = message;
        this.user_created = user_created;
    }
}

package tech.codingclub.helix.entity;

public class Follow {
    public Long user_id;
    public Long following_id;

    public Follow() {
    }

    public Follow(Long user_id, Long following_id) {
        this.user_id = user_id;
        this.following_id = following_id;
    }




}

import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="like"
export default class extends Controller {
  static targets = ["likeButton", "liked", "notLiked"]
  static values = {
    likeflag: Number
  }

  connect() {
    this.like_state = this.likeflagValue
    if (this.like_state === 1) {
      this.likedTarget.classList.remove("hidden");
      this.notLikedTarget.classList.add("hidden");
    } else {
      this.likedTarget.classList.add("hidden");
      this.notLikedTarget.classList.remove("hidden");
    }
  }

  toggleLike (e) {
    console.log(this.likeflagValue);
    if (this.like_state === 1) {
      this.likedTarget.classList.add("hidden");
      this.notLikedTarget.classList.remove("hidden");
      this.like_state = 0
    } else {
      this.likedTarget.classList.remove("hidden");
      this.notLikedTarget.classList.add("hidden");
      this.like_state = 1
    }
  }
}

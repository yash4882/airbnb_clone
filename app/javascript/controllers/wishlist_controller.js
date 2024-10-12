import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  updateWishlistStatus() {

    const isUserLoggedIn = this.element.dataset.userLoggedIn;
    if (isUserLoggedIn === "false"){
      document.getElementsByClassName("js-login")[0].click();
      return
    }
    
    if (this.element.dataset.status === "false"){
      this.element.classList.remove("fill-none");
      this.element.classList.add("fill-primary");
      this.element.dataset.status = "true";
    }
    else {
      this.element.classList.remove("fill-primary");
      this.element.classList.add("fill-none");
      this.element.dataset.status = "false";
    }
  }
}

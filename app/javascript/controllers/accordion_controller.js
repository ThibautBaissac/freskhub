import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="accordion"
export default class extends Controller {
  static targets = ["button", "content"]
  static values = { singleOpen: Boolean }

  connect() {
    this.contentTargets.forEach(content => {
      content.style.maxHeight = "0px";
    })
  }

  toggleItem(event) {
    const content = event.currentTarget.nextElementSibling;
    const isOpen = content.style.maxHeight !== "0px";

    if (this.singleOpenValue) {
      this.closeAll();
      if (!isOpen) {
        this.openContent(content);
        event.currentTarget.classList.add("active");
      }
    } else {
      if (isOpen) {
        this.closeContent(content);
        event.currentTarget.classList.remove("active");
      } else {
        this.openContent(content);
        event.currentTarget.classList.add("active");
      }
    }
  }

  toggleAll() {
    const allOpen = this.contentTargets.every(content => content.style.maxHeight !== "0px");

    this.contentTargets.forEach(content => {
      if (allOpen) {
        this.closeContent(content);
      } else {
        this.openContent(content);
      }
    });

    this.buttonTargets.forEach(button => {
      if (allOpen) {
        button.classList.remove("active");
      } else {
        button.classList.add("active");
      }
    });
  }

  closeAll() {
    this.contentTargets.forEach(content => {
      this.closeContent(content);
    });
    this.buttonTargets.forEach(button => button.classList.remove("active"));
  }

  openContent(content) {
    content.style.maxHeight = content.scrollHeight + "px";
  }

  closeContent(content) {
    content.style.maxHeight = "0px";
  }
}

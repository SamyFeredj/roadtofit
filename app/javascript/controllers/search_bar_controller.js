import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-bar"
export default class extends Controller {
  static targets = ["input", "clearButton"]


  connect() {
    console.log("Search bar controller connected");
  }


  searchRecettes(event) {
    event.preventDefault();
    const query = this.inputTarget.value.toLowerCase();

    const recettesCards = document.querySelectorAll('.recettes-card');

    if (query.length === 0) {
      recettesCards.forEach(card => {
        card.style.display = 'block';
      });
    } else {
      recettesCards.forEach(card => {
        const title = card.querySelector('h4').textContent.toLowerCase();
        if (title.includes(query)) {
          card.style.display = 'block';
        } else {
          card.style.display = 'none';
        }
      });
    }
  }

  submit(event) {
    event.preventDefault();
  }
}


//   connect() {
//     console.log("hello c connecte")
//     this.toggleClearButton();
//   }

//   toggleClearButton() {
//     if (this.inputTarget.value) {
//       this.clearButtonTarget.style.display = "inline";
//     } else {
//       this.clearButtonTarget.style.display = "none";
//     }
//   }

//   clearInput() {
//     this.inputTarget.value = "";
//     this.toggleClearButton();

//     const urlWithoutQuery = window.location.pathname;
//     window.location.href = urlWithoutQuery;
//   }

//   inputChanged() {
//     this.toggleClearButton();
//   }
// }

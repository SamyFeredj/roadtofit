import { Controller } from "stimulus"
import { Turbo } from "@hotwired/turbo-rails"

export default class extends Controller {
  static targets = ["commentForm", "commentList", "contentInput"]

  // Méthode pour ajouter un commentaire
  async addComment(event) {
    event.preventDefault()

    const form = this.commentFormTarget
    const formData = new FormData(form)

    // Envoie la requête AJAX pour ajouter le commentaire
    const response = await fetch(form.action, {
      method: "POST",
      body: formData,
      headers: { "Accept": "application/json" }
    })

    if (response.ok) {
      const newCommentHTML = await response.text()
      this.commentListTarget.insertAdjacentHTML("beforeend", newCommentHTML) // Ajoute le nouveau commentaire dans la liste

      // Réinitialise le formulaire
      form.reset()
    } else {
      console.error("Erreur lors de l'ajout du commentaire")
    }
  }

  // Méthode pour supprimer un commentaire
  async deleteComment(event) {
    event.preventDefault()

    const commentId = event.target.dataset.commentId
    const postId = event.target.dataset.postId;  // Assure-toi que tu as aussi cet ID.


    const response = await fetch(`/posts/${postId}/commentaires/${commentId}`, {
      method: "DELETE",
      headers: { "Accept": "application/json" }
    })

    if (response.ok) {

      const commentaireElement = document.getElementById(`commentaire_${commentId}`);
      if (commentaireElement) {
        // Supprimer le <li> du commentaire
        commentaireElement.remove();

        // Vérifier si le parent <ul> devient vide
        const ulElement = commentaireElement.closest('ul');
        if (ulElement && ulElement.children.length === 0) {
          // Supprimer le <ul> si vide
          ulElement.remove();

          // Vérifier si la <div> parent de <ul> devient vide
          const divElement = ulElement.closest('.border.rounded.p-3');
          if (divElement && divElement.querySelectorAll('ul').length === 0) {
            // Supprimer la <div> si vide
            divElement.remove();
          }
        }
      }
    } else {
      alert("Erreur lors de la suppression du commentaire");
    }
  }
}

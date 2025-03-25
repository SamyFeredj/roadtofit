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
      // Si la suppression réussit, retire le commentaire du DOM
      document.getElementById(`comment_${commentId}`).remove();
    } else {
      alert("Erreur lors de la suppression du commentaire");
    }
  }
}

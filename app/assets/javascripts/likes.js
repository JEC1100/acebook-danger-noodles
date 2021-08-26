document.addEventListener('DOMContentLoaded', () => {
  const posts = document.querySelectorAll('.post');
  posts.forEach((post) => {

    post.querySelector('.like-button').addEventListener('click', (e) => {
      likeButton = post.querySelector(".like-button")
      token = likeButton.querySelector("input[name=authenticity_token]").value; 
      e.preventDefault();

      fetch(`posts/${post.id}/likes`, {
        method: 'POST',
        credentials: 'same-origin',
        headers: {
          'X-Requested-With': 'XMLHttpRequest',
          'X-CSRF-Token': token
        },
      })
      .then(response => response.text())
      .then(text => {
        const parser = new DOMParser();
        const htmlDocument = parser.parseFromString(text, "text/html");
        updatedLike = htmlDocument.getElementById(`like-num${post.id}`).innerHTML
        post.querySelector('.likes').innerHTML = updatedLike;
      })
      });
    });
  });

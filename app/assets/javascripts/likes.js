document.addEventListener('DOMContentLoaded', () => {
  const posts = document.querySelectorAll('.post');
  posts.forEach((post) => {
    post.querySelector('.like-button').addEventListener('click', (event) => { 
      event.preventDefault();
      // testing = post.querySelector(".button_to")
      token = post.querySelector("input[name=authenticity_token]").value;
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
        console.log(htmlDocument.body.div)
        const updatedLike = htmlDocument.documentElement.querySelector(`ID${post.id}`).innerHTML;
        post.querySelector('.likes').innerHTML = updatedLike;
      })
      });
    });
  });

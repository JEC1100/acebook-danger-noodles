document.addEventListener('DOMContentLoaded', () => {
  const posts = document.querySelectorAll('.post');

  function loadComments() { posts.forEach((post) => {
    if (post.querySelector('.like-button') !== null) { 
      likingStuff(post)
    } else { 
      unlikingStuff(post)
    }
  });
}
loadComments();

  function likingStuff(post) {
    let likeButton = post.querySelector(`.like-button`)
    likeButton.addEventListener('click', (event) => {
      event.preventDefault();
      console.log(post.id)
      token = post.querySelector("input[name=authenticity_token]").value;
      fetch(`posts/${post.id}/likes/`, {
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
        updatedLikeButton = htmlDocument.querySelector('.unlike-button')
        console.log(updatedLikeButton)
        insertAfter(likeButton, updatedLikeButton)
        likeButton.remove();
        post.querySelector('.likes').innerHTML = updatedLike;
        loadComments();
      })
    })
  };

  function insertAfter(referenceNode, newNode) {
    referenceNode.parentNode.insertBefore(newNode, referenceNode.nextSibling);
  }

  function unlikingStuff(post) {
    let likeButton = post.querySelector(`.unlike-button`) 
    likeButton.addEventListener('click', (event) => { 
      event.preventDefault();
      console.log(likeButton)
      token = post.querySelector("input[name=authenticity_token]").value;
      let formData = new FormData()
      formData.append("_method", 'delete')
      fetch(`posts/${post.id}/likes/${likeButton.id}`, {
        method: 'POST',
        credentials: 'same-origin',
        headers: {
          'X-Requested-With': 'XMLHttpRequest',
          'X-CSRF-Token': token
        },
        body: formData
      })
      .then(response => response.text())
      .then(text => {
        const parser = new DOMParser();
        const htmlDocument = parser.parseFromString(text, "text/html");
        console.log(htmlDocument)
        updatedLike = htmlDocument.getElementById(`like-num${post.id}`).innerHTML
        updatedLikeButton = htmlDocument.getElementById(`like-button${post.id}`)
        console.log(updatedLikeButton)
        insertAfter(likeButton, updatedLikeButton)
        likeButton.remove();
        post.querySelector('.likes').innerHTML = updatedLike;
        loadComments();
      })
    });
  }
});

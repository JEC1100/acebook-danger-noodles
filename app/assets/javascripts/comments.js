document.addEventListener('DOMContentLoaded', (event) => {
  const posts = document.querySelectorAll('.post');
  // posts.forEach((post) => {
  //   post.querySelector('.comment-button').addEventListener('click', (e) => {
  //  
  //     commentBox = post.querySelector("#comment_content")
  //     console.log(comment)
  //     token = likeButton.querySelector("input[name=authenticity_token").value; 
  //     e.preventDefault();
  //     fetch(`posts/${post.id}/comments`, {
  //       method: 'POST',
  //       credentials: 'same-origin',
  //       headers: {
  //         'X-Requested-With': 'XMLHttpRequest',
  //         'X-CSRF-Token': token
  //       },
  //     })
      // .then(response => response.text())
      // .then(text => {
      //   const parser = new DOMParser();
      //   const htmlDocument = parser.parseFromString(text, "text/html");
      //   const updatedLike = htmlDocument.documentElement.querySelector(".likes").innerHTML;
      //   post.querySelector('.likes').innerHTML = updatedLike;
      });
      // });
    // });
  // });
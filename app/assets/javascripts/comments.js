document.addEventListener('DOMContentLoaded', (event) => {
  const posts = document.querySelectorAll('.post');

  function insertAfter(referenceNode, newNode) {
    referenceNode.parentNode.insertBefore(newNode, referenceNode.nextSibling);
  }
  posts.forEach((post) => {
    post.querySelector('.comment-button').addEventListener('click', (e) => {
    let commentBox = post.querySelector(".comment-content")
    let commentList = post.querySelector(`#comment${post.id}`)
    let commentText = post.querySelector("#comment_content").value
    let token = commentBox.querySelector("input[name=authenticity_token]").value; 
      console.log(token)
      e.preventDefault()
      formData = new FormData()
      formData.append('comment[content]', commentText)
      formData.append('commit', 'Create Comment')
      fetch(`posts/${post.id}/comments`, {
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
        const updatedComment = htmlDocument.documentElement.querySelector(`#comment${post.id}`).lastElementChild;
        commentList.appendChild(updatedComment);
        post.querySelector("#comment_content").value = ""
        console.log(updatedComment);
      });
    });
  });
});

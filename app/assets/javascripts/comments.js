document.addEventListener('DOMContentLoaded', (event) => {
  const posts = document.querySelectorAll('.post');
  posts.forEach((post) => {
    post.querySelector('.comment-button').addEventListener('click', (e) => {
        console.log("Output")
        console.log(post)
      commentBox = post.querySelector(".comment-content")
      token = commentBox.querySelector("input[name=authenticity_token]").value; 
      console.log(token)
      console.log(commentBox.name)
      e.preventDefault()
      fetch(`posts/${post.id}/comments`, {
        method: 'POST',
        credentials: 'same-origin',
        headers: {
          'X-Requested-With': 'XMLHttpRequest',
          'X-CSRF-Token': token
        },
        data: {
        "comment[content]": commentBox.name,
        "commit": "Create Comment"  
        }
      })
      .then(response => response.text())
      .then(text => {
        const parser = new DOMParser();
        const htmlDocument = parser.parseFromString(text, "text/html");
        const updatedComment = htmlDocument.documentElement.querySelector(".comment-content").innerHTML;
        post.querySelector('.comment-content').innerHTML = updatedComment;
        console.log("Output")
      });
    });
  });
});

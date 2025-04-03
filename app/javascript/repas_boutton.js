const repasLinks = document.querySelectorAll('.repas');

repasLinks.forEach(repasLink => {
  repasLink.addEventListener('click', () => {
    console.log("hello");
    console.log("yo");
    document.querySelector('.active')?.classList.remove('active');
    repasLink.classList.add('active');
  });
});

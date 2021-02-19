function list() {
  const imageTag = document.querySelectorAll('.image-tag');
  imageTag.forEach(function(tag) {
    const next = tag.nextElementSibling;
    tag.addEventListener('click', () => {
      next.setAttribute('style', 'display: block;');
    });
    document.addEventListener('click', (e) => {
      if(!e.target.closest('.list')) {
        if(next.getAttribute('style') == 'display: block;') {
          next.removeAttribute('style', 'display: block;')
        };
      };
    });
  });
};
window.addEventListener('load', list);
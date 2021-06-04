import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["find your favourite movies", "add comments",
              "share them with your friends!"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };

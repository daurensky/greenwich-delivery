const init = () => {
    const catalog = document.querySelector('.catalog')
    const menuBtns = document.querySelectorAll('.menu-btn')

    if (menuBtns && catalog) {
        menuBtns.forEach(menuBtn => {
            menuBtn.addEventListener('click', () => {
                catalog.classList.toggle('active')

                if (catalog.classList.contains('active'))
                    document.body.style.overflow = 'hidden'
                else document.body.removeAttribute('style')
            })
        })
    }

    const backBtn = document.querySelector('.back-btn')

    if (backBtn) {
        backBtn.addEventListener('click', () => {
            window.history.back()
        })
    }
}

document.addEventListener('DOMContentLoaded', init)

document.addEventListener('DOMContentLoaded', function () {
    // Toggle Switch
    const contenedor = document.querySelector('.contenedor')
    const toggleSwitch = document.querySelector('.switch')

    toggleSwitch.addEventListener('click', () => {
        contenedor.classList.toggle('dark-theme')
    })

    const aside = document.querySelector('aside')
    const toggleMenu = document.querySelector('.toggle-menu')

    toggleMenu.addEventListener('click', () => {
        aside.classList.toggle('active')
        toggleMenu.classList.toggle('active')
    })


    // Dropdown Menu
    const mainMenus = document.querySelectorAll('.main-menu')

    mainMenus.forEach((mainMenu) => {
        const subMenu = mainMenu.nextElementSibling

        if(subMenu) {
            mainMenu.addEventListener('click', () => {
                mainMenu.classList.toggle('active')
                subMenu.classList.toggle('active')
            })
        }
    })

})
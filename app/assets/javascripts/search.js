document.addEventListener('DOMContentLoaded', () => {
    const modelNameSelector = document.querySelector('#model-selector');

    const projectRadio = modelNameSelector.querySelector('input[value=Project]');
    const courseRadio = modelNameSelector.querySelector('input[value=Course]');
    const fieldRadio = modelNameSelector.querySelector('input[value=Field]');

    const bortnikSelectorContainer = document.querySelector('#bortnik-selector-container');
    const stageSelectorContainer = document.querySelector('#stage-selector-container');
    const ntiSelectorContainer = document.querySelector('#nti-selector-container');
    const projectTypeSelectorContainer =document.querySelector('#project-type-selector-container');

    const hide = (element) => element.style.display = 'none';
    const show = (element) => element.style.display = 'block';

    const hideMany = (...elements) => elements.forEach(hide)
    const showMany = (...elements) => elements.forEach(show);

    const showAll = () => {
        showMany(bortnikSelectorContainer, stageSelectorContainer,
            ntiSelectorContainer, projectTypeSelectorContainer);
    }

    const hideAll = () => {
        hideMany(bortnikSelectorContainer, stageSelectorContainer,
            ntiSelectorContainer, projectTypeSelectorContainer);
    }

    projectRadio.addEventListener('change', showAll);

    courseRadio.addEventListener('change', hideAll);

    fieldRadio.addEventListener('change', hideAll);
    
    const getModelNameFromUrl = () => {
        const url = new URL(window.location.href);
        return url.searchParams.get('model_name');
    }
    
    const autoSelectRadio = (modelName) => {
        if (modelName == null) {
            return;
        }
        const radio = modelNameSelector.querySelector(`input[value=${modelName}]`)
        radio.checked = true;
        radio.dispatchEvent(new Event('change'))
    } 
    
    autoSelectRadio(getModelNameFromUrl());

})
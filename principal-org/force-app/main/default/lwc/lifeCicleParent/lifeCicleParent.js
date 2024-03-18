import { LightningElement } from 'lwc';

export default class LifeCicleParent extends LightningElement {
    isChildVisible = false;

    constructor(){
        super();
        //this.template.addEventListener('mousehover',function(){}); OK
        console.log('parent constructor called')
    }
    
    connectedCallback(){
        console.log('parent connectedCallback called')
    }
    
    //é chamado toda vez que ocorre alguma alteração no componente, como por exemplo no input
    renderedCallback(){
        console.log('parent renderedCallback called')
    }

    name;
    changeHandler(event){
        this.name = event.target.value;
    }

    handlerClick(event){
        this.isChildVisible = !this.isChildVisible
    }

    errorCallback(error, stack){
        console.log(error.message)
        console.log(stack)
    }
}
import { LightningElement } from 'lwc';

export default class LifeCicleChild extends LightningElement {
    constructor(){
        super();
        //this.template.addEventListener('mousehover',function(){}); OK
        console.log('child constructor called')
    }
    
    //interval;
    connectedCallback(){
        console.log('child connectedCallback called')
        //window.addEventListener('click',this.handlerClick)
        //this.interval = window.setInterval()
        throw new Error('Mensagem de Erro no loading como TESTE')
    }
    
    renderedCallback(){
        console.log('child renderedCallback called')
    }
    
    disconnectedCallback(){
        console.log('child disconnectedCallback called')
        alert('Child disconnectedCallback called!!')
        //window.removeEventListener('click',this.handlerClick)
        //window.clearInterval(this.interval)
    }
}
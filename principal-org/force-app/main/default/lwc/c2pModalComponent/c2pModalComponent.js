import { LightningElement } from 'lwc';

export default class C2pModalComponent extends LightningElement {

    closeModel(){
        const customE = new CustomEvent('close', {
            detail: {
                msg:"Show modal successfuly!!!"
            }
        })
        this.dispatchEvent(customE)
    }

    //Bubbling event faz com que seja buscado para execução todos os exentos em cascata no DOM
    close2Model(){
        const customE = new CustomEvent('close2', {
            bubbles: true,
            detail: {
                msg:"Show modal successfuly 2!!!"
            }
        })
        this.dispatchEvent(customE)
    }

    footerHandler(){
        console.log('Child to Parent Communication Using Event Bubbling')
    }
}
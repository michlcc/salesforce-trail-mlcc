import { LightningElement } from 'lwc';

export default class C2pParentComponent extends LightningElement {
    msg
    showModal = false

    clickHandler(){
        this.showModal = true;
    }

    closeHandler(event){
        this.msg = event.detail.msg
        this.showModal = false
    }
}
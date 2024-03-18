import { LightningElement } from 'lwc';

export default class OneStyle extends LightningElement {

    percent = 10;

    percentChangeHandler(event){
        this.percent = event.target.value;
    }

    get percentcss(){
        return `width: ${this.percent}%`
    }
}
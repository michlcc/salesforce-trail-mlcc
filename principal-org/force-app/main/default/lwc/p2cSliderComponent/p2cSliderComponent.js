import { LightningElement, api } from 'lwc';

export default class P2cSliderComponent extends LightningElement {

    val = 50

    changeHandler(event){
        this.val = event.target.value
    }

    @api resetSlider(){
        this.val = 50
    }
}
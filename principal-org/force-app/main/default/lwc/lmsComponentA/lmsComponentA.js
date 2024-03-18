import { LightningElement, wire } from 'lwc';
import SAMPLEMC from '@salesforce/messageChannel/sampleMessage__c';
import { MessageContext, publish } from 'lightning/messageService';

export default class LmsComponentA extends LightningElement {

    inputValue

    @wire (MessageContext)
    context

    inputHadler(event){
        this.inputValue = event.target.value
    }

    publishMessage(){
        const message = {
            lmsMessage: {
                value: this.inputValue
            }
        }
        //publish(messageContext, messageChannel, message)
        publish(
            this.context, 
            SAMPLEMC, 
            message
        )
    }
}
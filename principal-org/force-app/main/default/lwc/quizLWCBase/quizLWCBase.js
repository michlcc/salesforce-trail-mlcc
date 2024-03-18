import { LightningElement } from 'lwc';

export default class QuizLWCBase extends LightningElement {

    isAnswer = false;
    scoreAnswer = 0;
    selected = {};
    myQuestions = [
        {
            id:"Question1",
            question:"Which one of the following is not a template loop?",
            answer:{
                a:"for:each",
                b:"interator",
                c:"map loop"
            },
            correctAnswer:"c"
        },
        {
            id:"Question2",
            question:"Which of the file is invalid in LWC component folder?",
            answer:{
                a:".svg",
                b:".apex",
                c:".js"
            },
            correctAnswer:"b"
        },        {
            id:"Question3",
            question:"Which one of the following is not a directive",
            answer:{
                a:"for:each",
                b:"if:true",
                c:"@track"
            },
            correctAnswer:"c",
        }
    ]

    changeHandler(event){
       const {name,value} = event.target
       this.selected = {...this.selected, [name]:value}
    }

    get allNotSelected(){
        return !(Object.keys(this.selected).length === this.myQuestions.length)
    }

    get isScoredFull(){
        return `slds-text-heading_large ${this.myQuestions.length === this.scoreAnswer?
            'slds-text-color_success':'slds-text-color_error'}`
    }

    submitHandler(event){
        event.preventDefault()
        let correct = this.myQuestions.filter(item=> this.selected[item.id]==item.correctAnswer)
        this.scoreAnswer = correct.length
        this.isAnswer = true;
    }

    resetHandler(){
        this.selected = {}
        this.correctAnswer = 0;
        this.isAnswer = false
    }
}
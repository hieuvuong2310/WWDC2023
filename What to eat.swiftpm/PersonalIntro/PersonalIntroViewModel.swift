//
//  File.swift
//  
//
//  Created by Hieu Vuong on 2023-04-17.
//

import Foundation

@MainActor
class PersonalIntroViewModel: ObservableObject {
    @Published var intro: [String]
    @Published private(set) var loading: Bool = false
    private var count: Int = 0
    @Published var continueOn: Bool = true
    var onContinue: () -> Void = { fatalError("PersonalIntro.onContinue was invoked before being initialized") }
    init(intro: [String], onContinue: (() -> Void)?){
        if let onContinue {
            self.onContinue = onContinue
        }
        self.intro = intro
    }
    convenience init(onContinue: (()->Void)?) {
        self.init(intro: ["Hi! My name is Trong Hieu Vuong. I was born and raised up in Ho Chi Minh City, Vietnam, and currently living in Canada", "Living far away from home makes me miss the food in my hometown. Before moving to another country, I had a chance to do a food tour around the country and realized I had missed a lot of interesting and delicious food", "Therefore, this motivates me to create an app that I can share all my comfort foods, which I found them worth trying if you have a chance to visit Vietnam", "So, what do you usually think of when mentioning Vietnamese cuisine? Do you think Viet cuisine only has Pho?", "That is wrong, we have numerous types of foods, made from different ingredients, and differing from region to region", "Now, let me guide you through the list of specialties in Vietnam."], onContinue: onContinue)
    }
    
    func getIntro() -> String{
        if(count >= intro.count){
            continueOn.toggle()
            return ""
        }
        else {
            return (intro[count])
        }
    }
    
    func continueTapped() {
        if(count >= 0 && count < intro.count){
            count += 1
        }
    }
    func moveNext() {
        onContinue()
    }
}

//
//  ComplicationController.swift
//  GeloouWatch Extension
//
//  Created by Arthur Bastos Fanck on 05/03/20.
//  Copyright © 2020 Academy. All rights reserved.
//

import ClockKit


class ComplicationController: NSObject, CLKComplicationDataSource {
    
    // MARK: - Timeline Configuration
    
    func getSupportedTimeTravelDirections(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimeTravelDirections) -> Void) {
        handler([.forward])
    }
    
    func getTimelineStartDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        handler(nil)
    }
    
    func getTimelineEndDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        handler(nil)
    }
    
    func getPrivacyBehavior(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationPrivacyBehavior) -> Void) {
        handler(.showOnLockScreen)
    }
    
    // MARK: - Timeline Population
    
    func getCurrentTimelineEntry(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimelineEntry?) -> Void) {
        // Call the handler with the current timeline entry
        let entry = getTimelineEntry(complicationFamily: complication.family)
        handler(entry)
    }
    
    func getTimelineEntries(for complication: CLKComplication, before date: Date, limit: Int, withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void) {
        // Call the handler with the timeline entries prior to the given date
        handler(nil)
    }
    
    func getTimelineEntries(for complication: CLKComplication, after date: Date, limit: Int, withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void) {
        // Call the handler with the timeline entries after to the given date
        handler(nil)
    }
    
    // MARK: - Placeholder Templates
    
    func getLocalizableSampleTemplate(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTemplate?) -> Void) {
        // This method will be called once per supported complication, and the results will be cached
        var template: CLKComplicationTemplate?
        let defaultPercent: Float = 0
        let defaultTime: Int = 0
        let defaultCurrentTemp: String = "5"
        let defaultTargetTemp: String = "0"
        
        switch complication.family {
        case .circularSmall:
            template = createCircularSmallTemplate(percent: defaultPercent, currentTemperature: defaultCurrentTemp)
        
        case .extraLarge:
            template = createExtraLargeTemplate(percent: defaultPercent, currentTemperature: defaultCurrentTemp)
        
        case .graphicBezel:
            template = createGraphicBezel(percent: defaultPercent, currentTemperature: defaultCurrentTemp, timeLeft: defaultTime.description)
            
        case .graphicCircular:
            template = createGraphicCircularTemplate(percent: defaultPercent, currentTemperature: defaultCurrentTemp)
            
        case .graphicCorner:
            template = createGraphicCornerTemplate(percent: defaultPercent, currentTemperature: defaultCurrentTemp, targetTemperature: defaultTargetTemp)
        
        case .graphicRectangular:
            template = createGraphicRectangularTemplate(percent: defaultPercent, timeLeft: defaultTime.description)
            
        case .modularSmall:
            template = createModularSmallTemplate(percent: defaultPercent, currentTemperature: defaultCurrentTemp)
            
        case .modularLarge:
            template = createModularLargeTemplate(timeLeft: defaultTime.description)
            
        case .utilitarianSmall:
            template = createUtilitarianSmallTemplate(percent: defaultPercent, currentTemperature: defaultCurrentTemp)
            
        case .utilitarianLarge:
            template = createUtilitarianLarge(timeLeft: defaultTime.description)
            
        default:
            template = nil
        }
        handler(template)
    }
    
    // MARK: - Create Timeline Entry
    
    func getTimelineEntry(complicationFamily: CLKComplicationFamily) -> CLKComplicationTimelineEntry? {
        var entry: CLKComplicationTimelineEntry?
        
        let percent: Float = Model.shared.percent
        let timeLeft: Int = Model.shared.timeLeft
        let currentTemperature: Float = Model.shared.currentTemperature
        let targetTemperature: Float = Model.shared.targetTemperature
        let currentTempText = String(Int(currentTemperature))
        let targetTempText = String(Int(targetTemperature))
        
        switch complicationFamily {
        case .circularSmall:
            let template = createCircularSmallTemplate(percent: percent, currentTemperature: currentTempText)
            entry = CLKComplicationTimelineEntry(date: Date(), complicationTemplate: template)
        
        case .extraLarge:
            let template = createExtraLargeTemplate(percent: percent, currentTemperature: currentTempText)
            entry = CLKComplicationTimelineEntry(date: Date(), complicationTemplate: template)
            
        case .graphicBezel:
            let template = createGraphicBezel(percent: percent, currentTemperature: currentTempText, timeLeft: timeLeft.description)
            entry = CLKComplicationTimelineEntry(date: Date(), complicationTemplate: template)
            
        case .graphicCircular:
            let template = createGraphicCircularTemplate(percent: percent, currentTemperature: currentTempText)
            entry = CLKComplicationTimelineEntry(date: Date(), complicationTemplate: template)
            
        case .graphicCorner:
            let template = createGraphicCornerTemplate(percent: percent, currentTemperature: currentTempText, targetTemperature: targetTempText)
            entry = CLKComplicationTimelineEntry(date: Date(), complicationTemplate: template)
        
        case .graphicRectangular:
            let template = createGraphicRectangularTemplate(percent: percent, timeLeft: timeLeft.description)
            entry = CLKComplicationTimelineEntry(date: Date(), complicationTemplate: template)
            
        case .modularSmall:
            let template = createModularSmallTemplate(percent: percent, currentTemperature: currentTempText)
            entry = CLKComplicationTimelineEntry(date: Date(), complicationTemplate: template)
            
        case .modularLarge:
            let template = createModularLargeTemplate(timeLeft: timeLeft.description)
            entry = CLKComplicationTimelineEntry(date: Date(), complicationTemplate: template)
        
        case .utilitarianSmall:
            let template = createUtilitarianSmallTemplate(percent: percent, currentTemperature: currentTempText)
            entry = CLKComplicationTimelineEntry(date: Date(), complicationTemplate: template)
        
        case .utilitarianLarge:
            let template = createUtilitarianLarge(timeLeft: timeLeft.description)
            entry = CLKComplicationTimelineEntry(date: Date(), complicationTemplate: template)
            
        default:
            entry = nil
        }
        
        return entry
    }
    
    // MARK: - Create Complications Template
    
    func createCircularSmallTemplate(percent: Float, currentTemperature: String) -> CLKComplicationTemplateCircularSmallStackImage {
        let circularSmall = CLKComplicationTemplateCircularSmallStackImage()
        
        circularSmall.line1ImageProvider = CLKImageProvider(onePieceImage: UIImage())
        circularSmall.line2TextProvider = CLKSimpleTextProvider(text: currentTemperature + "ºC")
        
        return circularSmall
    }
    
    func createExtraLargeTemplate(percent: Float, currentTemperature: String) -> CLKComplicationTemplateExtraLargeStackImage {
        let extraLarge = CLKComplicationTemplateExtraLargeStackImage()
        
        extraLarge.line1ImageProvider = CLKImageProvider(onePieceImage: UIImage())
        extraLarge.line2TextProvider = CLKSimpleTextProvider(text: currentTemperature + "ºC")
        extraLarge.highlightLine2 = true
        
        return extraLarge
    }
    
    func createGraphicBezel(percent: Float, currentTemperature: String, timeLeft: String) -> CLKComplicationTemplateGraphicBezelCircularText {
        let graphicBezel = CLKComplicationTemplateGraphicBezelCircularText()
        
        graphicBezel.textProvider = CLKSimpleTextProvider(text: timeLeft + " minutos restantes")
        graphicBezel.circularTemplate = createGraphicCircularTemplate(percent: percent, currentTemperature: currentTemperature)
        return graphicBezel
    }
    
    func createGraphicCircularTemplate(percent: Float, currentTemperature: String) -> CLKComplicationTemplateGraphicCircularOpenGaugeSimpleText {
        let graphicCircular = CLKComplicationTemplateGraphicCircularOpenGaugeSimpleText()
        
        let redColor = UIColor(red: 216/255, green: 0/255, blue: 39/255, alpha: 1)
        let blueColor = UIColor(red: 117/255, green: 174/255, blue: 220/255, alpha: 1)
        
        graphicCircular.bottomTextProvider = CLKSimpleTextProvider(text: "ºC")
        graphicCircular.centerTextProvider = CLKSimpleTextProvider(text: currentTemperature)
        graphicCircular.gaugeProvider = CLKSimpleGaugeProvider(style: .ring, gaugeColors: [redColor, .white, blueColor], gaugeColorLocations: [0, 0.5, 0.9], fillFraction: percent/100)
        
        return graphicCircular
    }
    
    func createGraphicCornerTemplate(percent: Float, currentTemperature: String, targetTemperature: String) -> CLKComplicationTemplateGraphicCornerGaugeText {
        let graphicCorner = CLKComplicationTemplateGraphicCornerGaugeText()
        
        let redColor = UIColor(red: 216/255, green: 0/255, blue: 39/255, alpha: 1)
        let blueColor = UIColor(red: 117/255, green: 174/255, blue: 220/255, alpha: 1)
        
        graphicCorner.gaugeProvider = CLKSimpleGaugeProvider(style: .ring, gaugeColors: [redColor, .white, blueColor], gaugeColorLocations: [0, 0.5, 0.9], fillFraction: percent/100)
        //graphicCorner.trailingTextProvider = CLKSimpleTextProvider(text: targetTemperature.description)
        graphicCorner.outerTextProvider = CLKSimpleTextProvider(text: currentTemperature + "ºC")
        
        return graphicCorner
    }
    
    func createGraphicRectangularTemplate(percent: Float, timeLeft: String) -> CLKComplicationTemplateGraphicRectangularTextGauge {
        let graphicRectangular = CLKComplicationTemplateGraphicRectangularTextGauge()
        
        let redColor = UIColor(red: 216/255, green: 0/255, blue: 39/255, alpha: 1)
        let blueColor = UIColor(red: 117/255, green: 174/255, blue: 220/255, alpha: 1)
        
        graphicRectangular.gaugeProvider = CLKSimpleGaugeProvider(style: .ring, gaugeColors: [redColor, .white, blueColor], gaugeColorLocations: [0, 0.5, 0.9], fillFraction: percent/100)
        graphicRectangular.headerTextProvider = CLKSimpleTextProvider(text: "Tempo restante")
        graphicRectangular.body1TextProvider = CLKSimpleTextProvider(text: timeLeft + " minutos")
        
        return graphicRectangular
    }
    
    func createModularSmallTemplate(percent: Float, currentTemperature: String) -> CLKComplicationTemplateModularSmallStackImage {
        let modularSmall = CLKComplicationTemplateModularSmallStackImage()
        
        modularSmall.line1ImageProvider = CLKImageProvider(onePieceImage: UIImage())
        modularSmall.line2TextProvider = CLKSimpleTextProvider(text: currentTemperature + "ºC")
        modularSmall.highlightLine2 = true
        
        return modularSmall
    }
    
    func createModularLargeTemplate(timeLeft: String) -> CLKComplicationTemplateModularLargeTallBody {
        let modularLarge = CLKComplicationTemplateModularLargeTallBody()
        
        modularLarge.headerTextProvider = CLKSimpleTextProvider(text: "Tempo restante")
        modularLarge.bodyTextProvider = CLKSimpleTextProvider(text: timeLeft + " minutos")
        
        return modularLarge
    }
    
    func createUtilitarianSmallTemplate(percent: Float, currentTemperature: String) -> CLKComplicationTemplateUtilitarianSmallFlat {
        let utilitarianSmall = CLKComplicationTemplateUtilitarianSmallFlat()
        
        //utilitarianSmall.imageProvider = CLKImageProvider(onePieceImage: <#T##UIImage#>)
        utilitarianSmall.textProvider = CLKSimpleTextProvider(text: currentTemperature + "ºC")
        
        return utilitarianSmall
    }
    
    func createUtilitarianLarge(timeLeft: String) -> CLKComplicationTemplateUtilitarianLargeFlat {
        let utilitarianLarge = CLKComplicationTemplateUtilitarianLargeFlat()
        
        utilitarianLarge.textProvider = CLKSimpleTextProvider(text: "Tempo restante: " + timeLeft + " minutos")
        
        return utilitarianLarge
    }
}

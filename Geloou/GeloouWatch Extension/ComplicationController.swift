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
        handler([.forward, .backward])
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
        let defaultPercent: Double = 0
        let defaultTime: Int = 0
        let defaultBaseTemp: Float = 10
        let defaultCurrentTemp: Float = 5
        let defaultTargetTemp: Float = 0
        
        switch complication.family {
        case .circularSmall:
            template = createCircularSmallTemplate(percent: defaultPercent, timeLeft: defaultTime)
        
        case .extraLarge:
            template = createExtraLargeTemplate(percent: defaultPercent, timeLeft: defaultTime)
        
        case .graphicBezel:
            template = createGraphicBezel(percent: defaultPercent, timeLeft: defaultTime)
            
        case .graphicCircular:
            template = createGraphicCircularTemplate(percent: defaultPercent, timeLeft: defaultTime)
            
        case .graphicCorner:
            template = createGraphicCornerTemplate(percent: defaultPercent, baseTemperature: defaultBaseTemp, currentTemperature: defaultCurrentTemp, targetTemperature: defaultTargetTemp)
        
        case .graphicRectangular:
            template = createGraphicRectangularTemplate(percent: defaultPercent, timeLeft: defaultTime)
            
        case .modularSmall:
            template = createModularSmallTemplate(percent: defaultPercent, timeLeft: defaultTime)
            
        case .modularLarge:
            template = createModularLargeTemplate(timeLeft: defaultTime)
            
        case .utilitarianSmall,
             .utilitarianSmallFlat:
            template = createUtilitarianSmallTemplate(percent: defaultPercent)
            
        case .utilitarianLarge:
            template = createUtilitarianLarge(timeLeft: defaultTime)
            
        default:
            template = nil
        }
        handler(template)
    }
    
    // MARK: - Create Timeline Entry
    
    func getTimelineEntry(complicationFamily: CLKComplicationFamily) -> CLKComplicationTimelineEntry? {
        var entry: CLKComplicationTimelineEntry?
        
        var percent: Double = 0
        var timeLeft: Int = 0
        var baseTemperature: Float = 10
        var currentTemperature: Float = 5
        var targetTemperature: Float = 0
        
        switch complicationFamily {
        case .circularSmall:
            let template = createCircularSmallTemplate(percent: percent, timeLeft: timeLeft)
            entry = CLKComplicationTimelineEntry(date: Date(), complicationTemplate: template)
        
        case .extraLarge:
            let template = createExtraLargeTemplate(percent: percent, timeLeft: timeLeft)
            entry = CLKComplicationTimelineEntry(date: Date(), complicationTemplate: template)
            
        case .graphicBezel:
            let template = createGraphicBezel(percent: percent, timeLeft: timeLeft)
            entry = CLKComplicationTimelineEntry(date: Date(), complicationTemplate: template)
            
        case .graphicCircular:
            let template = createGraphicCircularTemplate(percent: percent, timeLeft: timeLeft)
            entry = CLKComplicationTimelineEntry(date: Date(), complicationTemplate: template)
            
        case .graphicCorner:
            let template = createGraphicCornerTemplate(percent: percent, baseTemperature: baseTemperature, currentTemperature: currentTemperature, targetTemperature: targetTemperature)
            entry = CLKComplicationTimelineEntry(date: Date(), complicationTemplate: template)
        
        case .graphicRectangular:
            let template = createGraphicRectangularTemplate(percent: percent, timeLeft: timeLeft)
            entry = CLKComplicationTimelineEntry(date: Date(), complicationTemplate: template)
            
        case .modularSmall:
            let template = createModularSmallTemplate(percent: percent, timeLeft: timeLeft)
            entry = CLKComplicationTimelineEntry(date: Date(), complicationTemplate: template)
            
        case .modularLarge:
            let template = createModularLargeTemplate(timeLeft: timeLeft)
            entry = CLKComplicationTimelineEntry(date: Date(), complicationTemplate: template)
        
        case .utilitarianSmall,
             .utilitarianSmallFlat:
            let template = createUtilitarianSmallTemplate(percent: percent)
            entry = CLKComplicationTimelineEntry(date: Date(), complicationTemplate: template)
        
        case .utilitarianLarge:
            let template = createUtilitarianLarge(timeLeft: timeLeft)
            entry = CLKComplicationTimelineEntry(date: Date(), complicationTemplate: template)
            
        default:
            entry = nil
        }
        
        return entry
    }
    
    // MARK: - Create Complications Template
    
    func createCircularSmallTemplate(percent: Double, timeLeft: Int) -> CLKComplicationTemplateCircularSmallRingText {
        let circularSmall = CLKComplicationTemplateCircularSmallRingText()
        
        circularSmall.fillFraction = Float(percent)
        circularSmall.ringStyle = .closed
        circularSmall.textProvider = CLKSimpleTextProvider(text: timeLeft.description)
        
        return circularSmall
    }
    
    func createExtraLargeTemplate(percent: Double, timeLeft: Int) -> CLKComplicationTemplateExtraLargeRingText {
        let extraLarge = CLKComplicationTemplateExtraLargeRingText()
        
        extraLarge.fillFraction = Float(percent)
        extraLarge.ringStyle = .closed
        extraLarge.textProvider = CLKSimpleTextProvider(text: timeLeft.description)
        
        return extraLarge
    }
    
    func createGraphicBezel(percent: Double, timeLeft: Int) -> CLKComplicationTemplateGraphicBezelCircularText {
        let graphicBezel = CLKComplicationTemplateGraphicBezelCircularText()
        
        graphicBezel.textProvider = CLKSimpleTextProvider(text: "Geloou • Tempo estimado" )
        graphicBezel.circularTemplate = createGraphicCircularTemplate(percent: percent, timeLeft: timeLeft)
        return graphicBezel
    }
    
    func createGraphicCircularTemplate(percent: Double, timeLeft: Int) -> CLKComplicationTemplateGraphicCircularClosedGaugeText {
        let graphicCircular = CLKComplicationTemplateGraphicCircularClosedGaugeText()
        
        graphicCircular.centerTextProvider = CLKSimpleTextProvider(text: timeLeft.description)
        graphicCircular.gaugeProvider = CLKSimpleGaugeProvider(style: .fill, gaugeColors: [.blue, .white], gaugeColorLocations: [1,100], fillFraction: Float(percent))
        
        return graphicCircular
    }
    
    func createGraphicCornerTemplate(percent: Double, baseTemperature: Float, currentTemperature: Float, targetTemperature: Float) -> CLKComplicationTemplateGraphicCornerGaugeText {
        let graphicCorner = CLKComplicationTemplateGraphicCornerGaugeText()
        
        graphicCorner.gaugeProvider = CLKSimpleGaugeProvider(style: .fill, gaugeColors: [.blue, .white], gaugeColorLocations: [1,100], fillFraction: Float(percent))
        graphicCorner.leadingTextProvider = CLKSimpleTextProvider(text: baseTemperature.description)
        graphicCorner.trailingTextProvider = CLKSimpleTextProvider(text: targetTemperature.description)
        graphicCorner.outerTextProvider = CLKSimpleTextProvider(text: currentTemperature.description + "ºC")
        
        return graphicCorner
    }
    
    func createGraphicRectangularTemplate(percent: Double, timeLeft: Int) -> CLKComplicationTemplateGraphicRectangularTextGauge {
        let graphicRectangular = CLKComplicationTemplateGraphicRectangularTextGauge()
        
        graphicRectangular.gaugeProvider = CLKSimpleGaugeProvider(style: .fill, gaugeColors: [.blue, .white], gaugeColorLocations: [1,100], fillFraction: Float(percent))
        graphicRectangular.headerTextProvider = CLKSimpleTextProvider(text: "Tempo estimado")
        graphicRectangular.body1TextProvider = CLKSimpleTextProvider(text: timeLeft.description)
        
        return graphicRectangular
    }
    
    func createModularSmallTemplate(percent: Double, timeLeft: Int) -> CLKComplicationTemplateModularSmallRingText {
        let modularSmall = CLKComplicationTemplateModularSmallRingText()
        
        modularSmall.fillFraction = Float(percent)
        modularSmall.ringStyle = .closed
        modularSmall.textProvider = CLKSimpleTextProvider(text: timeLeft.description)
        
        return modularSmall
    }
    
    func createModularLargeTemplate(timeLeft: Int) -> CLKComplicationTemplateModularLargeTallBody {
        let modularLarge = CLKComplicationTemplateModularLargeTallBody()
        
        modularLarge.headerTextProvider = CLKSimpleTextProvider(text: "Tempo estimado")
        modularLarge.bodyTextProvider = CLKSimpleTextProvider(text: timeLeft.description + "unidade")
        
        return modularLarge
    }
    
    func createUtilitarianSmallTemplate(percent: Double) -> CLKComplicationTemplateUtilitarianSmallRingText {
        let utilitarianSmall = CLKComplicationTemplateUtilitarianSmallRingText()
        
        utilitarianSmall.fillFraction = Float(percent)
        utilitarianSmall.ringStyle = .closed
        utilitarianSmall.textProvider = CLKSimpleTextProvider(text: percent.description + "%")
        
        return utilitarianSmall
    }
    
    func createUtilitarianLarge(timeLeft: Int) -> CLKComplicationTemplateUtilitarianLargeFlat {
        let utilitarianLarge = CLKComplicationTemplateUtilitarianLargeFlat()
        
        utilitarianLarge.textProvider = CLKSimpleTextProvider(text: "Tempo restante: " + timeLeft.description)
        
        return utilitarianLarge
    }
}

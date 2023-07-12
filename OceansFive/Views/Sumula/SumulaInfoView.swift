//
//  SumulaInfoView.swift
//  OceansFive
//
//  Created by Marcelo Pastana Duarte on 06/07/23.
//

import UIKit

var infos_vazia = [
    Info(icon: SFSymbolIcon.view("calendar", isActive: true), leading: "Data", trailing: "____ 2023 - __:__ pm"),
    Info(icon: SFSymbolIcon.view("mappin.and.ellipse", isActive: true), leading: "Local", trailing: "FEF quadra 1"),
    Info(icon: SFSymbolIcon.view("hand.raised.fill", isActive: true), leading: "Arbitro", trailing: "Otavio Mosquita"),
    Info(icon: SFSymbolIcon.view("person.fill", isActive: true), leading: "Tecnico \(Singleton.shared.sumula.timeA.time.abreviado)", trailing: Singleton.shared.sumula.timeA.time.tecnico),
    Info(icon: SFSymbolIcon.view("person.fill", isActive: true), leading: "Tecnico \(Singleton.shared.sumula.timeB.time.abreviado)", trailing: Singleton.shared.sumula.timeB.time.tecnico),
    Info(icon: SFSymbolIcon.view("exclamationmark.triangle.fill", isActive: true), leading: "Faltas \(Singleton.shared.sumula.timeA.time.abreviado)", trailing: "\(Sum().leitorFaltas(prd: 0, time: &Singleton.shared.sumula.timeA)) - \(Sum().leitorFaltas(prd: 1,time: &Singleton.shared.sumula.timeA)) - \(Sum().leitorFaltas(prd: 2,time: &Singleton.shared.sumula.timeA)) - \(Sum().leitorFaltas(prd: 3,time: &Singleton.shared.sumula.timeA))"),
    Info(icon: SFSymbolIcon.view("exclamationmark.triangle.fill", isActive: true), leading: "Faltas \(Singleton.shared.sumula.timeB.time.abreviado)", trailing: "\(Sum().leitorFaltas(prd: 0,time: &Singleton.shared.sumula.timeB)) - \(Sum().leitorFaltas(prd: 1,time: &Singleton.shared.sumula.timeB)) - \(Sum().leitorFaltas(prd: 2,time: &Singleton.shared.sumula.timeB)) - \(Sum().leitorFaltas(prd: 3,time: &Singleton.shared.sumula.timeB))"),
    Info(icon: SFSymbolIcon.view("clock.fill", isActive: true), leading: "Horario de Termino", trailing: "__:__ pm"),
]


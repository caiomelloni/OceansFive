//
//  SumulaInfoView.swift
//  OceansFive
//
//  Created by Marcelo Pastana Duarte on 06/07/23.
//

import UIKit

let infos_vazia = [
    Info(icon: SFSymbolIcon.view("calendar", isActive: true), leading: "Data", trailing: "____ 2023 - __:__ pm"),
    Info(icon: SFSymbolIcon.view("mappin.and.ellipse", isActive: true), leading: "Local", trailing: "FEF quadra 1"),
    Info(icon: SFSymbolIcon.view("hand.raised.fill", isActive: true), leading: "Arbitro", trailing: "Otavio Mosquita"),
    Info(icon: SFSymbolIcon.view("person.fill", isActive: true), leading: "Tecnico \(timeA.abreviado)", trailing: timeA.tecnico),
    Info(icon: SFSymbolIcon.view("person.fill", isActive: true), leading: "Tecnico \(timeB.abreviado)", trailing: timeB.tecnico),
    Info(icon: SFSymbolIcon.view("exclamationmark.triangle.fill", isActive: true), leading: "Faltas \(timeA.abreviado)", trailing: "_ _ _ _"),
    Info(icon: SFSymbolIcon.view("exclamationmark.triangle.fill", isActive: true), leading: "Faltas \(timeA.abreviado)", trailing: "_ _ _ _"),
    Info(icon: SFSymbolIcon.view("clock.fill", isActive: true), leading: "Horario de Termino", trailing: "__:__ pm"),
]


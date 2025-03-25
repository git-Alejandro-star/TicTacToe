//
//  Cell.swift
//  TicTacToe
//
//  Created by Alejandro Sanchez on 3/23/25.
//

import SwiftUI

struct Cell
{
    var tile: Tile
    
    func displayTile() -> String    
    {
        switch tile
        {
        case Tile.Nought:
            return "O"
        case Tile.Cross :
            return "X"
        default:
            return " "
        }
    }
    
    func tileColor() -> Color
    {
        switch tile
        {
        case Tile.Nought:
            return Color.red
        case Tile.Cross :
            return Color.black
        default:
            return Color.clear
        }
    }
}
enum Tile
{
    case Nought
    case Cross
    case Empty
}

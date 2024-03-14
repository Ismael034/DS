/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package ejercicio4.Filter;

import ejercicio4.MotorState.MotorState;

/**
 *
 * @author augus
 */
public interface Filter {
    public double execute(double rpm, MotorState state);
}

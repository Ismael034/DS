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
    int INCREASEVELOCITY = 100;
    int MAXVELOCITY = 5000;
    
    public double ejecutar(double revoluciones, MotorState estadoMotor);
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ejercicio4;

import ejercicio4.MotorState.MotorState;

/**
 *
 * @author augus
 */
public class Target {
    double velocity;
    double RADIO = 0.14;

    public double ejecutar(double revoluciones, MotorState estadoMotor) {
        velocity = 2 * Math.PI * RADIO * revoluciones * (60/1000);
        
        return velocity;
    }
}

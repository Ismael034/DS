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

    public double execute(double rpm, MotorState state) {
        velocity = 2 * Math.PI * RADIO * rpm * (60/1000);
        System.out.println("TARGET");
        System.out.println(rpm);
        return velocity;
    }
}

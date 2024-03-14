/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ejercicio4.Filter;

import ejercicio4.MotorState.MotorState;

/**
 *
 * @author augus
 */
public class FilterImpactFriction implements Filter {
    int FRICTION = 30;

    @Override
    public double execute(double rpm, MotorState state) {
        return rpm - FRICTION;
    }
}

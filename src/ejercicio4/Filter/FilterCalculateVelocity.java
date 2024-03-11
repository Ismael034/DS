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
public class FilterCalculateVelocity implements Filter {
    int INCREASEVELOCITY = 100;
    int MAXVELOCITY = 5000;
    @Override
    public double ejecutar(double revoluciones, MotorState estadoMotor) {
        switch(estadoMotor) {
            case MotorState.ACELERANDO -> {
                revoluciones += INCREASEVELOCITY;
                if (revoluciones > MAXVELOCITY) {
                    revoluciones = MAXVELOCITY;
                }
            }
            case MotorState.FRENANDO -> {
                revoluciones -= INCREASEVELOCITY;
                if (revoluciones < 0) {
                    revoluciones = 0;
                }
            }
        }
        
        return revoluciones;
    }
}

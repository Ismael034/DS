/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ejercicio4.Filter;

import ejercicio4.MotorState.MotorState;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author augus
 */
public class FilterChain {
    private List<Filter> filters = new ArrayList<>();
    private 
    
    public void addFilter( Filter filter) {
        this.filters.add(filter);
    }
    
    public void execute(double rpm, MotorState state) {
        for (Filter filter : this.filters) {
            filter.execute(rpm, state);
        }
    }
}

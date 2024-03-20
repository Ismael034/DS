/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package ejercicio4;

import ejercicio4.Filter.FilterCalculateVelocity;
import ejercicio4.Filter.FilterImpactFriction;
import ejercicio4.Filter.FilterManager;
import ejercicio4.MotorState.MotorState;
import java.awt.Color;

/**
 *
 * @author augus
 */
public class Speedometer extends javax.swing.JFrame {
    boolean engineOn = false;
    double increaseRPM = 0;
    float velocity = 0;
    double RADIO = 0.15;
    double KM =  0.067;
    double increaseKm = 0;
    double totalCounterNum = 0;
    private FilterManager filterManager = new FilterManager(this);
    private FilterCalculateVelocity filter1 = new FilterCalculateVelocity();
    private FilterImpactFriction filter2 = new FilterImpactFriction();

    public Speedometer() {
        this.filterManager.addFilter(filter1);
        this.filterManager.addFilter(filter2);
        initComponents();
    }
    
    public void execute(double rpm, MotorState state) {
        velocity = (float) (2 * Math.PI * RADIO * rpm * (60.0/1000.0));
        this.speed.setText(String.valueOf(velocity));
        this.rpm.setText(String.valueOf(rpm));
    }
    
    public void setSpeedUp() {
        this.speedUp.setText("Soltar acelerador");
        this.speedUp.setForeground(Color.red);
        this.stop.setText("FRENAR");
        this.stop.setForeground(Color.black);
        this.state.setText(MotorState.ACELERANDO.toString());
    }
    
    public void setStop() {
        this.stop.setText("Soltar freno");
        this.stop.setForeground(Color.red);
        this.speedUp.setText("ACELERAR");
        this.speedUp.setForeground(Color.black);
        this.state.setText(MotorState.FRENANDO.toString());
    }
    
    public void setEngineOn() {
        this.state.setText(MotorState.ENCENDIDO.toString());
        this.motorState.setForeground(Color.red);
        this.motorState.setText("APAGAR");
        this.recentCounter.setText("0.0");
        this.totalCounterNum = Double.parseDouble(this.totalCounter.getText().replace(',', '.'));
        this.speed.setText("0.0");
        this.rpm.setText("0.0");
    }
    
    public void setEngineOff() {
        this.state.setText(MotorState.APAGADO.toString());
        this.motorState.setForeground(Color.green);
        this.motorState.setText("ENCENDER");
        this.stop.setText("FRENAR");
        this.stop.setForeground(Color.black);
        this.speedUp.setText("ACELERAR");
        this.speedUp.setForeground(Color.black);
        this.increaseKm = 0;
    }
    
    public void setCounters() {
        this.increaseKm += this.KM;
        this.totalCounterNum += this.KM;
        this.recentCounter.setText(String.format("%.2f", increaseKm));
        this.totalCounter.setText(String.format("%.2f", totalCounterNum));
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel3 = new javax.swing.JPanel();
        buttonGroup1 = new javax.swing.ButtonGroup();
        jPanel4 = new javax.swing.JPanel();
        jPanel1 = new javax.swing.JPanel();
        state = new javax.swing.JLabel();
        jPanel2 = new javax.swing.JPanel();
        motorState = new javax.swing.JToggleButton();
        speedUp = new javax.swing.JToggleButton();
        stop = new javax.swing.JToggleButton();
        jPanel5 = new javax.swing.JPanel();
        jPanel7 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        jPanel9 = new javax.swing.JPanel();
        jPanel8 = new javax.swing.JPanel();
        jLabel2 = new javax.swing.JLabel();
        jPanel12 = new javax.swing.JPanel();
        jLabel3 = new javax.swing.JLabel();
        speed = new javax.swing.JTextField();
        jPanel10 = new javax.swing.JPanel();
        jLabel6 = new javax.swing.JLabel();
        jPanel6 = new javax.swing.JPanel();
        jLabel4 = new javax.swing.JLabel();
        recentCounter = new javax.swing.JTextField();
        jPanel11 = new javax.swing.JPanel();
        jLabel5 = new javax.swing.JLabel();
        totalCounter = new javax.swing.JTextField();
        jPanel13 = new javax.swing.JPanel();
        jLabel7 = new javax.swing.JLabel();
        jPanel14 = new javax.swing.JPanel();
        jLabel8 = new javax.swing.JLabel();
        rpm = new javax.swing.JTextField();

        javax.swing.GroupLayout jPanel3Layout = new javax.swing.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 100, Short.MAX_VALUE)
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 100, Short.MAX_VALUE)
        );

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        state.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        state.setText("APAGADO");

        motorState.setForeground(java.awt.Color.green);
        motorState.setText("ENCENDER");
        motorState.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                motorStateActionPerformed(evt);
            }
        });
        jPanel2.add(motorState);

        buttonGroup1.add(speedUp);
        speedUp.setText("ACELERAR");
        speedUp.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                speedUpActionPerformed(evt);
            }
        });
        jPanel2.add(speedUp);

        buttonGroup1.add(stop);
        stop.setText("FRENAR");
        stop.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                stopActionPerformed(evt);
            }
        });
        jPanel2.add(stop);

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(state, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, 400, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(0, 0, Short.MAX_VALUE)))
                .addContainerGap())
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(21, 21, 21)
                .addComponent(state)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, 55, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout jPanel4Layout = new javax.swing.GroupLayout(jPanel4);
        jPanel4.setLayout(jPanel4Layout);
        jPanel4Layout.setHorizontalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel4Layout.createSequentialGroup()
                .addGap(0, 0, Short.MAX_VALUE)
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
        );
        jPanel4Layout.setVerticalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
        );

        jPanel1.getAccessibleContext().setAccessibleName("");
        jPanel1.getAccessibleContext().setAccessibleDescription("");

        getContentPane().add(jPanel4, java.awt.BorderLayout.NORTH);

        jPanel5.setLayout(new java.awt.BorderLayout());

        jPanel7.setLayout(new java.awt.BorderLayout());

        jLabel1.setText("Salpicadero");
        jPanel7.add(jLabel1, java.awt.BorderLayout.CENTER);

        jPanel9.setLayout(new java.awt.BorderLayout());

        jPanel8.setLayout(new java.awt.GridLayout(2, 0));

        jLabel2.setText("Velocímetro");
        jPanel8.add(jLabel2);

        jLabel3.setText("Km/h:");
        jPanel12.add(jLabel3);

        speed.setText("0");
        speed.setPreferredSize(new java.awt.Dimension(120, 22));
        jPanel12.add(speed);

        jPanel8.add(jPanel12);

        jPanel9.add(jPanel8, java.awt.BorderLayout.PAGE_START);

        jPanel10.setLayout(new java.awt.GridLayout(3, 0));

        jLabel6.setText("Cuentakilómetros");
        jPanel10.add(jLabel6);

        jLabel4.setText("contador reciente:");
        jPanel6.add(jLabel4);

        recentCounter.setText("0");
        recentCounter.setPreferredSize(new java.awt.Dimension(120, 22));
        jPanel6.add(recentCounter);

        jPanel10.add(jPanel6);

        jLabel5.setText("contador total:");
        jPanel11.add(jLabel5);

        totalCounter.setText("0");
        totalCounter.setPreferredSize(new java.awt.Dimension(120, 22));
        totalCounter.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                totalCounterActionPerformed(evt);
            }
        });
        jPanel11.add(totalCounter);

        jPanel10.add(jPanel11);

        jPanel9.add(jPanel10, java.awt.BorderLayout.CENTER);

        jPanel13.setLayout(new java.awt.GridLayout(2, 0));

        jLabel7.setText("Cuentarrevoluciones");
        jPanel13.add(jLabel7);

        jLabel8.setText("RPM:");
        jPanel14.add(jLabel8);

        rpm.setText("0");
        rpm.setToolTipText("");
        rpm.setMinimumSize(new java.awt.Dimension(100, 22));
        rpm.setPreferredSize(new java.awt.Dimension(120, 22));
        jPanel14.add(rpm);

        jPanel13.add(jPanel14);

        jPanel9.add(jPanel13, java.awt.BorderLayout.PAGE_END);

        jPanel7.add(jPanel9, java.awt.BorderLayout.SOUTH);

        jPanel5.add(jPanel7, java.awt.BorderLayout.PAGE_START);

        getContentPane().add(jPanel5, java.awt.BorderLayout.SOUTH);

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void totalCounterActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_totalCounterActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_totalCounterActionPerformed

    private void motorStateActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_motorStateActionPerformed
        this.engineOn = !this.engineOn;
        if (this.engineOn) {
            this.setEngineOn();
        }
        
        if (!this.engineOn) {
            this.setEngineOff();
        } 
    }//GEN-LAST:event_motorStateActionPerformed

    private void speedUpActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_speedUpActionPerformed
        if (this.state.getText() != MotorState.APAGADO.toString()) {
            this.setSpeedUp();
            this.increaseRPM = Double.parseDouble(this.rpm.getText());
            this.filterManager.execute(this.increaseRPM, MotorState.ACELERANDO);
            this.setCounters();
            
        }
    }//GEN-LAST:event_speedUpActionPerformed

    private void stopActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_stopActionPerformed
        if (this.state.getText() != MotorState.APAGADO.toString()) {
            this.setStop();
            this.increaseRPM = Double.parseDouble(this.rpm.getText());
            this.filterManager.execute(this.increaseRPM, MotorState.FRENANDO);
            if (Double.parseDouble(speed.getText().replace(',', '.')) != 0.0) {
                this.setCounters();
            }
        }
    }//GEN-LAST:event_stopActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(Speedometer.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Speedometer.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Speedometer.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Speedometer.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Speedometer().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.ButtonGroup buttonGroup1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel10;
    private javax.swing.JPanel jPanel11;
    private javax.swing.JPanel jPanel12;
    private javax.swing.JPanel jPanel13;
    private javax.swing.JPanel jPanel14;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JPanel jPanel5;
    private javax.swing.JPanel jPanel6;
    private javax.swing.JPanel jPanel7;
    private javax.swing.JPanel jPanel8;
    private javax.swing.JPanel jPanel9;
    private javax.swing.JToggleButton motorState;
    private javax.swing.JTextField recentCounter;
    private javax.swing.JTextField rpm;
    private javax.swing.JTextField speed;
    private javax.swing.JToggleButton speedUp;
    private javax.swing.JLabel state;
    private javax.swing.JToggleButton stop;
    private javax.swing.JTextField totalCounter;
    // End of variables declaration//GEN-END:variables
}

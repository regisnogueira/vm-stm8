#ifndef __USER_DISPLAY_H__
#define __USER_DISPLAY_H__
#include "stm8s.h"

#define EN_USER_DISPLAY

#define SEG_A_PORT_NUM GPIOD
#define SEG_A_PIN_NUM  GPIO_PIN_5

#define SEG_B_PORT_NUM GPIOA
#define SEG_B_PIN_NUM  GPIO_PIN_2

#define SEG_C_PORT_NUM GPIOC
#define SEG_C_PIN_NUM  GPIO_PIN_7

#define SEG_D_PORT_NUM GPIOD
#define SEG_D_PIN_NUM  GPIO_PIN_3

#define SEG_E_PORT_NUM GPIOD
#define SEG_E_PIN_NUM  GPIO_PIN_1

#define SEG_F_PORT_NUM GPIOA
#define SEG_F_PIN_NUM  GPIO_PIN_1

#define SEG_G_PORT_NUM GPIOC
#define SEG_G_PIN_NUM  GPIO_PIN_6

#define DP_PORT_NUM GPIOD
#define DP_PIN_NUM  GPIO_PIN_2

#define DIG1_PORT_NUM GPIOD
#define DIG1_PIN_NUM  GPIO_PIN_4

#define DIG2_PORT_NUM GPIOB
#define DIG2_PIN_NUM  GPIO_PIN_5

#define DIG3_PORT_NUM GPIOB
#define DIG3_PIN_NUM  GPIO_PIN_4

#undef gpio_set(a,b)
#undef gpio_clr(a,b)
#undef gpio_dir_out(a,b)

#define gpio_set(a,b)  GPIO_WriteHigh(a, (GPIO_Pin_TypeDef)b)
#define gpio_clr(a,b)  GPIO_WriteLow(a, (GPIO_Pin_TypeDef)b)
#define gpio_dir_out(a,b) GPIO_Init(a, (GPIO_Pin_TypeDef)b, GPIO_MODE_OUT_PP_LOW_FAST);

#define seg_a_dir()  gpio_dir_out(SEG_A_PORT_NUM,SEG_A_PIN_NUM)
#define seg_a_on()   gpio_set    (SEG_A_PORT_NUM,SEG_A_PIN_NUM)
#define seg_a_off()  gpio_clr    (SEG_A_PORT_NUM,SEG_A_PIN_NUM)

#define seg_b_dir()  gpio_dir_out(SEG_B_PORT_NUM,SEG_B_PIN_NUM)
#define seg_b_on()   gpio_set    (SEG_B_PORT_NUM,SEG_B_PIN_NUM)
#define seg_b_off()  gpio_clr    (SEG_B_PORT_NUM,SEG_B_PIN_NUM)

#define seg_c_dir()  gpio_dir_out(SEG_C_PORT_NUM,SEG_C_PIN_NUM)
#define seg_c_on()   gpio_set    (SEG_C_PORT_NUM,SEG_C_PIN_NUM)
#define seg_c_off()  gpio_clr    (SEG_C_PORT_NUM,SEG_C_PIN_NUM)

#define seg_d_dir()  gpio_dir_out(SEG_D_PORT_NUM,SEG_D_PIN_NUM)
#define seg_d_on()   gpio_set    (SEG_D_PORT_NUM,SEG_D_PIN_NUM)
#define seg_d_off()  gpio_clr    (SEG_D_PORT_NUM,SEG_D_PIN_NUM)

#define seg_e_dir()  gpio_dir_out(SEG_E_PORT_NUM,SEG_E_PIN_NUM)
#define seg_e_on()   gpio_set    (SEG_E_PORT_NUM,SEG_E_PIN_NUM)
#define seg_e_off()  gpio_clr    (SEG_E_PORT_NUM,SEG_E_PIN_NUM)

#define seg_f_dir()  gpio_dir_out(SEG_F_PORT_NUM,SEG_F_PIN_NUM)
#define seg_f_on()   gpio_set    (SEG_F_PORT_NUM,SEG_F_PIN_NUM)
#define seg_f_off()  gpio_clr    (SEG_F_PORT_NUM,SEG_F_PIN_NUM)

#define seg_g_dir()  gpio_dir_out(SEG_G_PORT_NUM,SEG_G_PIN_NUM)
#define seg_g_on()   gpio_set    (SEG_G_PORT_NUM,SEG_G_PIN_NUM)
#define seg_g_off()  gpio_clr    (SEG_G_PORT_NUM,SEG_G_PIN_NUM)

#define dp_dir()     gpio_dir_out(DP_PORT_NUM,DP_PIN_NUM)
#define dp_on()      gpio_set    (DP_PORT_NUM,DP_PIN_NUM)
#define dp_off()     gpio_clr    (DP_PORT_NUM,DP_PIN_NUM)

#define display_off()   seg_a_off(); \
                        seg_b_off(); \
                        seg_c_off(); \
                        seg_d_off(); \
                        seg_e_off(); \
                        seg_f_off(); \
                        seg_g_off()

#define display_zero()  seg_a_on(); \
                        seg_b_on(); \
                        seg_c_on(); \
                        seg_d_on(); \
                        seg_e_on(); \
                        seg_f_on(); \
                        seg_g_off()

#define display_one()   seg_a_off(); \
                        seg_b_on(); \
                        seg_c_on(); \
                        seg_d_off(); \
                        seg_e_off(); \
                        seg_f_off(); \
                        seg_g_off()
                        
#define display_two()   seg_a_on(); \
                        seg_b_on(); \
                        seg_c_off(); \
                        seg_d_on(); \
                        seg_e_on(); \
                        seg_f_off(); \
                        seg_g_on()
                        
#define display_three() seg_a_on(); \
                        seg_b_on(); \
                        seg_c_on(); \
                        seg_d_on(); \
                        seg_e_off(); \
                        seg_f_off(); \
                        seg_g_on()
                        
#define display_four()  seg_a_off(); \
                        seg_b_on(); \
                        seg_c_on(); \
                        seg_d_off(); \
                        seg_e_off(); \
                        seg_f_on(); \
                        seg_g_on()
                        
#define display_five()  seg_a_on(); \
                        seg_b_off(); \
                        seg_c_on(); \
                        seg_d_on(); \
                        seg_e_off(); \
                        seg_f_on(); \
                        seg_g_on()
                        
#define display_six()   seg_a_on(); \
                        seg_b_off(); \
                        seg_c_on(); \
                        seg_d_on(); \
                        seg_e_on(); \
                        seg_f_on(); \
                        seg_g_on()
                        
#define display_seven() seg_a_on(); \
                        seg_b_on(); \
                        seg_c_on(); \
                        seg_d_off(); \
                        seg_e_off(); \
                        seg_f_off(); \
                        seg_g_off()
                        
#define display_eight() seg_a_on(); \
                        seg_b_on(); \
                        seg_c_on(); \
                        seg_d_on(); \
                        seg_e_on(); \
                        seg_f_on(); \
                        seg_g_on()
                        
#define display_nine()  seg_a_on(); \
                        seg_b_on(); \
                        seg_c_on(); \
                        seg_d_on(); \
                        seg_e_off(); \
                        seg_f_on(); \
                        seg_g_on()
                        
#define dig1_dir()  gpio_dir_out(DIG1_PORT_NUM,DIG1_PIN_NUM)
#define dig1_on()   gpio_clr    (DIG1_PORT_NUM,DIG1_PIN_NUM)
#define dig1_off()  gpio_set    (DIG1_PORT_NUM,DIG1_PIN_NUM)

#define dig2_dir()  gpio_dir_out(DIG2_PORT_NUM,DIG2_PIN_NUM)
#define dig2_on()   gpio_clr    (DIG2_PORT_NUM,DIG2_PIN_NUM)
#define dig2_off()  gpio_set    (DIG2_PORT_NUM,DIG2_PIN_NUM)

#define dig3_dir()  gpio_dir_out(DIG3_PORT_NUM,DIG3_PIN_NUM)
#define dig3_on()   gpio_clr    (DIG3_PORT_NUM,DIG3_PIN_NUM)
#define dig3_off()  gpio_set    (DIG3_PORT_NUM,DIG3_PIN_NUM)

void init_display(void);

#endif

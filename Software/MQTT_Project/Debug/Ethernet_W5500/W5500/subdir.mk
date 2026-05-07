################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Ethernet_W5500/W5500/w5500.c 

OBJS += \
./Ethernet_W5500/W5500/w5500.o 

C_DEPS += \
./Ethernet_W5500/W5500/w5500.d 


# Each subdirectory must supply rules for building sources it contributes
Ethernet_W5500/W5500/%.o Ethernet_W5500/W5500/%.su Ethernet_W5500/W5500/%.cyclo: ../Ethernet_W5500/W5500/%.c Ethernet_W5500/W5500/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DSTM32 -DSTM32G0 -DSTM32G0B0RETx -c -I../Inc -I/media/matheus-cipolotti/MDC/SENAI/TCC/Software/MQTT_Project/CMSIS/Device -I/media/matheus-cipolotti/MDC/SENAI/TCC/Software/MQTT_Project/CMSIS/Include -I/media/matheus-cipolotti/MDC/SENAI/TCC/Software/MQTT_Project/Ethernet_W5500 -I/media/matheus-cipolotti/MDC/SENAI/TCC/Software/MQTT_Project/Ethernet_W5500/MQTT -I/media/matheus-cipolotti/MDC/SENAI/TCC/Software/MQTT_Project/Ethernet_W5500/MQTT/MQTTPacket/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Ethernet_W5500-2f-W5500

clean-Ethernet_W5500-2f-W5500:
	-$(RM) ./Ethernet_W5500/W5500/w5500.cyclo ./Ethernet_W5500/W5500/w5500.d ./Ethernet_W5500/W5500/w5500.o ./Ethernet_W5500/W5500/w5500.su

.PHONY: clean-Ethernet_W5500-2f-W5500


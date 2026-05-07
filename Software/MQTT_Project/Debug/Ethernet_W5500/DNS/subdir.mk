################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Ethernet_W5500/DNS/dns.c 

OBJS += \
./Ethernet_W5500/DNS/dns.o 

C_DEPS += \
./Ethernet_W5500/DNS/dns.d 


# Each subdirectory must supply rules for building sources it contributes
Ethernet_W5500/DNS/%.o Ethernet_W5500/DNS/%.su Ethernet_W5500/DNS/%.cyclo: ../Ethernet_W5500/DNS/%.c Ethernet_W5500/DNS/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DSTM32 -DSTM32G0 -DSTM32G0B0RETx -c -I../Inc -I/media/matheus-cipolotti/MDC/SENAI/TCC/Software/MQTT_Project/CMSIS/Device -I/media/matheus-cipolotti/MDC/SENAI/TCC/Software/MQTT_Project/CMSIS/Include -I/media/matheus-cipolotti/MDC/SENAI/TCC/Software/MQTT_Project/Ethernet_W5500 -I/media/matheus-cipolotti/MDC/SENAI/TCC/Software/MQTT_Project/Ethernet_W5500/MQTT -I/media/matheus-cipolotti/MDC/SENAI/TCC/Software/MQTT_Project/Ethernet_W5500/MQTT/MQTTPacket/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Ethernet_W5500-2f-DNS

clean-Ethernet_W5500-2f-DNS:
	-$(RM) ./Ethernet_W5500/DNS/dns.cyclo ./Ethernet_W5500/DNS/dns.d ./Ethernet_W5500/DNS/dns.o ./Ethernet_W5500/DNS/dns.su

.PHONY: clean-Ethernet_W5500-2f-DNS


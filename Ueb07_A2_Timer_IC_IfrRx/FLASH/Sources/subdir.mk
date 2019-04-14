################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.local

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS_QUOTED += \
"../Sources/ifrRxFront.c" \
"../Sources/main.c" \
"../Sources/sound.c" \

C_SRCS += \
../Sources/ifrRxFront.c \
../Sources/main.c \
../Sources/sound.c \

OBJS += \
./Sources/ifrRxFront_c.obj \
./Sources/main_c.obj \
./Sources/sound_c.obj \

OBJS_QUOTED += \
"./Sources/ifrRxFront_c.obj" \
"./Sources/main_c.obj" \
"./Sources/sound_c.obj" \

C_DEPS += \
./Sources/ifrRxFront_c.d \
./Sources/main_c.d \
./Sources/sound_c.d \

C_DEPS_QUOTED += \
"./Sources/ifrRxFront_c.d" \
"./Sources/main_c.d" \
"./Sources/sound_c.d" \

OBJS_OS_FORMAT += \
./Sources/ifrRxFront_c.obj \
./Sources/main_c.obj \
./Sources/sound_c.obj \


# Each subdirectory must supply rules for building sources it contributes
Sources/ifrRxFront_c.obj: ../Sources/ifrRxFront.c
	@echo 'Building file: $<'
	@echo 'Executing target #1 $<'
	@echo 'Invoking: HCS08 Compiler'
	"$(HC08ToolsEnv)/chc08" -ArgFile"Sources/ifrRxFront.args" -ObjN="Sources/ifrRxFront_c.obj" "$<" -Lm="$(@:%.obj=%.d)" -LmCfg=xilmou
	@echo 'Finished building: $<'
	@echo ' '

Sources/%.d: ../Sources/%.c
	@echo 'Regenerating dependency file: $@'
	
	@echo ' '

Sources/main_c.obj: ../Sources/main.c
	@echo 'Building file: $<'
	@echo 'Executing target #2 $<'
	@echo 'Invoking: HCS08 Compiler'
	"$(HC08ToolsEnv)/chc08" -ArgFile"Sources/main.args" -ObjN="Sources/main_c.obj" "$<" -Lm="$(@:%.obj=%.d)" -LmCfg=xilmou
	@echo 'Finished building: $<'
	@echo ' '

Sources/sound_c.obj: ../Sources/sound.c
	@echo 'Building file: $<'
	@echo 'Executing target #3 $<'
	@echo 'Invoking: HCS08 Compiler'
	"$(HC08ToolsEnv)/chc08" -ArgFile"Sources/sound.args" -ObjN="Sources/sound_c.obj" "$<" -Lm="$(@:%.obj=%.d)" -LmCfg=xilmou
	@echo 'Finished building: $<'
	@echo ' '



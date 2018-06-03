include config.mk

BUILDBASE := build
BUILD := $(BUILDBASE)/$(BUILD_NAME)

MD5 := md5sum -c
PYTHON := python
PYTHON3 := python3.6

RGBASM := rgbasm -D$(GAME_VERSION)=1 -DDEBUG=$(DEBUG)
RGBGFX := rgbgfx
RGBLINK := rgblink
RGBFIX := rgbfix

RGBASMFLAGS := -h -E -i $(BUILD)/
tools/gfx :=
tools/make_shim :=

ROM := poke$(BUILD_NAME)_spaceworld.gb
ROMS := pokegold_spaceworld.gb pokesilver_spaceworld.gb pokegold_debug_spaceworld.gb pokesilver_debug_spaceworld.gb
BASEROM := baserom_$(BUILD_NAME).gb
DIRS := home engine data audio
OBJS := $(addprefix $(BUILD)/, gfx.o sram.o wram.o hram.o shim.o)
SHIM := shim_$(BUILD_NAME).sym

rwildcard = $(foreach d, $(wildcard $1*), $(filter $(subst *, %, $2), $d) $(call rwildcard, $d/, $2))
OBJS += $(patsubst %.asm, $(BUILD)/%.o, $(call rwildcard, $(DIRS), *.asm))

GFX := $(patsubst %.png, $(BUILD)/%.2bpp, \
       $(patsubst %.1bpp.png, $(BUILD)/%.1bpp, \
       $(patsubst gfx/pokemon/%/front.png, $(BUILD)/gfx/pokemon/%/front.pic, \
       $(patsubst gfx/pokemon/%/back.png, $(BUILD)/gfx/pokemon/%/back.pic, \
       $(call rwildcard, gfx, *.png)))))

.SECONDEXPANSION:

.PHONY: all
all: $(ROM)

.PHONY: tools
tools tools/pkmncompress tools/gfx:
	$(MAKE) -C tools/

# Remove files generated by the build process.
.PHONY: clean
clean:
	rm -rf $(ROMS) $(BUILDBASE) $(ROMS:.gb=.sym) $(ROMS:.gb=.map)
	make -C tools clean

# Remove files except for graphics.
.PHONY: mostlyclean
mostlyclean:
	rm -rf $(ROMS) $(OBJS) $(ROMS:.gb=.sym) $(ROMS:.gb=.map)

$(ROM): $(OBJS)
	$(RGBLINK) -d -n $(@:.gb=.sym) -m $(@:.gb=.map) -O $(BASEROM) -o $@ $^
	$(RGBFIX) -f lh -k 01 -l 0x33 -m 0x03 -p 0 -r 3 -t "POKEMON2$(GAME_VERSION)" $@
	-$(PYTHON3) sort_sym.py $(@:.gb=.sym)

$(BUILD)/shim.asm: $(SHIM) | $$(dir $$@)
	tools/make_shim -w $< > $@

$(BUILD)/gfx.o: | $(GFX)
$(BUILD)/%.o: $(BUILD)/%.asm | $$(dir $$@)
	$(RGBASM) $(RGBASMFLAGS) -M $(@:.o=.d) $(OUTPUT_OPTION) $<
$(BUILD)/%.o: %.asm | $$(dir $$@)
	$(RGBASM) $(RGBASMFLAGS) -M $(@:.o=.d) $(OUTPUT_OPTION) $<

$(BUILD)/gfx/sgb/sgb_border_alt.2bpp: tools/gfx += --trim-whitespace
$(BUILD)/gfx/sgb/sgb_border_gold.2bpp: tools/gfx += --trim-whitespace
$(BUILD)/gfx/sgb/sgb_border_silver.2bpp: tools/gfx += --trim-whitespace
$(BUILD)/gfx/title/title_gold.2bpp: tools/gfx += --trim-whitespace
$(BUILD)/gfx/title/title_silver.2bpp: tools/gfx += --trim-whitespace
$(BUILD)/gfx/trainer_card/leaders.2bpp: tools/gfx += --trim-whitespace
$(BUILD)/gfx/minigames/slots.2bpp: tools/gfx += --trim-whitespace
$(BUILD)/gfx/minigames/poker.2bpp: tools/gfx += --trim-whitespace
$(BUILD)/gfx/intro/purin_pikachu.2bpp: tools/gfx += --trim-whitespace

.PRECIOUS: $(BUILD)/%.pic
$(BUILD)/%.pic: $(BUILD)/%.2bpp tools/pkmncompress | $$(dir $$@)
	tools/pkmncompress $< $@

.PRECIOUS: $(BUILD)/%.2bpp
$(BUILD)/%.2bpp: %.png tools/gfx | $$(dir $$@)
	$(RGBGFX) $(OUTPUT_OPTION) $<
	tools/gfx $(tools/gfx) $(OUTPUT_OPTION) $@

.PRECIOUS: $(BUILD)/%.1bpp
$(BUILD)/%.1bpp: %.1bpp.png tools/gfx | $$(dir $$@)
	$(RGBGFX) -d1 $(OUTPUT_OPTION) $<
	tools/gfx $(tools/gfx) -d1 $(OUTPUT_OPTION) $@

.PRECIOUS: $(BUILD)/%.tilemap
$(BUILD)/%.tilemap: %.png | $$(dir $$@)
	$(RGBGFX) -t $@ $<

.PRECIOUS: %/
%/:
	mkdir -p $@

-include $(call rwildcard, $(BUILD)/, *.d)

gold:         ; @$(MAKE) GAME_VERSION=GOLD
gold_debug:   ; @$(MAKE) GAME_VERSION=GOLD DEBUG=1
silver:       ; @$(MAKE) GAME_VERSION=SILVER
silver_debug: ; @$(MAKE) GAME_VERSION=SILVER DEBUG=1
compare: ;
	@$(MAKE) GAME_VERSION=GOLD COMPARE=1
	@$(MAKE) GAME_VERSION=GOLD DEBUG=1 COMPARE=1
	@$(MAKE) GAME_VERSION=SILVER COMPARE=1
	@$(MAKE) GAME_VERSION=SILVER DEBUG=1 COMPARE=1
	@$(MD5) roms.md5

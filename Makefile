CC=emcc
CXX=em++

CFLAGS=-O3 -DNDEBUG -Iinclude
CXXFLAGS=$(CFLAGS)


.PHONY=all lib clean


LIBJSONPATH=src/lib_json
LIBJSONOBJS=$(LIBJSONPATH)/json_reader.o $(LIBJSONPATH)/json_value.o $(LIBJSONPATH)/json_writer.o

LIBFILE=libjsoncpp.a

all:lib

%.o:%.cpp
	$(CXX) $(CXXFLAGS) $< -o $@ -c

lib:$(LIBFILE)

$(LIBFILE):$(LIBJSONOBJS)
	emar cr $@ $(LIBJSONOBJS)
	emranlib $@

clean:
	rm -f $(LIBJSONOBJS)
	rm -f $(LIBFILE)
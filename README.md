### Fish (lorem ipsum) lines for nim

```nim
proc loremIpsum*(): string
## Get accuraly "Lorem ipsum..." line.

assert loremIpsum() == "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sit amet risus tortor. In eget odio quis nulla suscipit condimentum a in purus. Mauris non consequat dolor, pharetra aliquet sem. Vivamus quis libero sit amet nisl placerat efficitur. Nunc eleifend vestibulum urna, eget sagittis urna rhoncus vitae. Fusce in congue lacus. Mauris sit amet nisl commodo, aliquet sem id, porta velit. Suspendisse vulputate, est nec imperdiet dignissim, felis nulla congue diam, in dignissim turpis est at augue. Cras consectetur, velit eget condimentum sollicitudin, ex metus rutrum nulla, nec sodales est metus eget est. Aenean volutpat eros et dui sollicitudin lacinia. Vivamus ultricies nisl risus, quis dapibus quam tincidunt sit amet."
```
```nim
proc loremWords*(wNum: Positive, loremStart = true): string
## Get fish line with `wNum` word count.
## Starts with "Lorem ipsum..." if `loremStart`.
```
```nim
proc loremLines*(pNum, wNum: Positive, loremStart = true, lfmt = lfLine): string
## Get `pNum` number of lorem paragraphs with `wNum`
## word length each and `lfmt` formatting. No random in vm.
## Starts with "Lorem ipsum..." if `loremStart`.
```
```nim
proc loremTexts*(pNum: Positive, loremStart = true, lfmt = lfLine): string
## Get `pNum` number of full lorem paragraphs
## and `lfmt` formatting. No random in vm.
## Starts with "Lorem ipsum..." if `loremStart`.
```
lfmt example:
```nim
loremLines(pNum = 2, wNum = 10, loremStart = false, lfmt = ...)
```
* *lfNone*
```
Etiam tristique tincidunt tempor. Suspendisse consectetur sollicitudin ex nec viverra.
Nulla sodales eros placerat elit aliquet dictum. Aliquam rutrum iaculis.
```
* *lfLine*
```
Nulla facilisi. In at finibus sapien. Proin lectus turpis, feugiat.

Integer ac velit nec neque tempus pharetra. Sed a arcu.
```
* *lfHtml*
```
<ul><li>Pellentesque pulvinar eros vitae eros laoreet, eget egestas libero tincidunt.</li><li>Phasellus odio arcu, tristique ut est ut, congue hendrerit dolor.</li></ul>
```

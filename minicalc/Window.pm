package Window;

use strict;
use warnings;

use QtCore4;
use QtGui4;
# [0]
use QtCore4::isa qw( Qt::Widget );
use QtCore4::slots;

sub echoLineEdit() {
    return this->{echoLineEdit};
}

sub setEchoLineEdit() {
    return this->{echoLineEdit} = shift;
}

sub addendLineEdit() {
    return this->{addendLineEdit};
}

sub addend2LineEdit() {
    return this->{addend2LineEdit};
}

sub setAddendLineEdit() {
    return this->{addendLineEdit} = shift;
}

sub setAddend2LineEdit() {
    return this->{addend2LineEdit} = shift;
}

sub alignmentLineEdit() {
    return this->{alignmentLineEdit};
}

sub setAlignmentLineEdit() {
    return this->{alignmentLineEdit} = shift;
}

sub resultLineEdit() {
    return this->{resultLineEdit};
}

sub setAccessLineEdit() {
    return this->{resultLineEdit} = shift;
}

# [0]

# [0]
sub NEW {
    my ( $class, $parent ) = @_;
    $class->SUPER::NEW( $parent );

    my $addendGroup = Qt::GroupBox(this->tr('Addend #1'));

    my $addendLabel = Qt::Label(this->tr('Addend #1:'));

    my $addend2Group = Qt::GroupBox(this->tr('Addend #2'));

    my $addend2Label = Qt::Label(this->tr('Addend #2:'));
    
    this->setAddendLineEdit( Qt::LineEdit() );
    this->setAddend2LineEdit( Qt::LineEdit() );
# [1]

# [2]
    my $alignmentGroup = Qt::GroupBox(this->tr('Alignment'));

    my $alignmentLabel = Qt::Label(this->tr('Type:'));
    my $alignmentComboBox = Qt::ComboBox();
    $alignmentComboBox->addItem(this->tr('Left'));
    $alignmentComboBox->addItem(this->tr('Centered'));
    $alignmentComboBox->addItem(this->tr('Right'));

    this->setAlignmentLineEdit( Qt::LineEdit() );

    my $resultGroup = Qt::GroupBox(this->tr('Result:'));

    my $resultLabel = Qt::Label(this->tr('Result:'));

    this->setAccessLineEdit( Qt::LineEdit() );

    this->resultLineEdit->setReadOnly(1);

    my $addendLayout = Qt::GridLayout();
    $addendLayout->addWidget($addendLabel, 0, 0);
    $addendLayout->addWidget(this->addendLineEdit, 1, 0, 1, 2);
    $addendGroup->setLayout($addendLayout);

    this->addendLineEdit->setValidator(Qt::DoubleValidator(5,
            999.0, 2, this->addendLineEdit));

    my $addend2Layout = Qt::GridLayout();
    $addend2Layout->addWidget($addend2Label, 0, 0);
    $addend2Layout->addWidget(this->addend2LineEdit, 1, 0, 1, 2);
    $addend2Group->setLayout($addend2Layout);

    this->addend2LineEdit->setValidator(Qt::DoubleValidator(5,
            999.0, 2, this->addend2LineEdit));

    my $alignmentLayout = Qt::GridLayout();
    $alignmentLayout->addWidget($alignmentLabel, 0, 0);
    $alignmentLayout->addWidget($alignmentComboBox, 0, 1);
    $alignmentLayout->addWidget(this->alignmentLineEdit, 1, 0, 1, 2);
    $alignmentGroup->setLayout($alignmentLayout);

    my $resultLayout = Qt::GridLayout();
    $resultLayout->addWidget($resultLabel, 0, 0);
    $resultLayout->addWidget(this->resultLineEdit, 1, 0, 1, 2);
    $resultGroup->setLayout($resultLayout);
# [7]

# [8]
    my $layout = Qt::GridLayout();
    $layout->addWidget($addendGroup, 0, 0);
    $layout->addWidget($addend2Group, 0, 1);
    $layout->addWidget($resultGroup, 0, 2);
    this->setLayout($layout);

    this->setWindowTitle(this->tr('Line Edits'));
}

1;

package Window;

use strict;
use warnings;

use QtCore4;
use QtGui4;
# [0]
use QtCore4::isa qw( Qt::Widget );
use QtCore4::slots
    echoChanged => ['int'],
    alignmentChanged => ['int'],
    accessChanged => ['int'];

sub echoLineEdit() {
    return this->{echoLineEdit};
}

sub setEchoLineEdit() {
    return this->{echoLineEdit} = shift;
}

sub validatorLineEdit() {
    return this->{validatorLineEdit};
}

sub validator2LineEdit() {
    return this->{validator2LineEdit};
}

sub setValidatorLineEdit() {
    return this->{validatorLineEdit} = shift;
}

sub setValidator2LineEdit() {
    return this->{validator2LineEdit} = shift;
}

sub alignmentLineEdit() {
    return this->{alignmentLineEdit};
}

sub setAlignmentLineEdit() {
    return this->{alignmentLineEdit} = shift;
}

sub accessLineEdit() {
    return this->{accessLineEdit};
}

sub setAccessLineEdit() {
    return this->{accessLineEdit} = shift;
}

# [0]

# [0]
sub NEW {
    my ( $class, $parent ) = @_;
    $class->SUPER::NEW( $parent );

    my $validatorGroup = Qt::GroupBox(this->tr('Validator'));

    my $validatorLabel = Qt::Label(this->tr('Type:'));

    my $validator2Group = Qt::GroupBox(this->tr('Validator'));

    my $validator2Label = Qt::Label(this->tr('Type:'));
    
    this->setValidatorLineEdit( Qt::LineEdit() );
    this->setValidator2LineEdit( Qt::LineEdit() );
# [1]

# [2]
    my $alignmentGroup = Qt::GroupBox(this->tr('Alignment'));

    my $alignmentLabel = Qt::Label(this->tr('Type:'));
    my $alignmentComboBox = Qt::ComboBox();
    $alignmentComboBox->addItem(this->tr('Left'));
    $alignmentComboBox->addItem(this->tr('Centered'));
    $alignmentComboBox->addItem(this->tr('Right'));

    this->setAlignmentLineEdit( Qt::LineEdit() );

    my $accessGroup = Qt::GroupBox(this->tr('Result:'));

    my $accessLabel = Qt::Label(this->tr('Result:'));

    this->setAccessLineEdit( Qt::LineEdit() );

    this->accessLineEdit->setReadOnly(1);
    this->connect($alignmentComboBox, SIGNAL 'activated(int)',
            this, SLOT 'alignmentChanged(int)');

    my $validatorLayout = Qt::GridLayout();
    $validatorLayout->addWidget($validatorLabel, 0, 0);
    $validatorLayout->addWidget(this->validatorLineEdit, 1, 0, 1, 2);
    $validatorGroup->setLayout($validatorLayout);

    this->validatorLineEdit->setValidator(Qt::DoubleValidator(5,
            999.0, 2, this->validatorLineEdit));

    my $validator2Layout = Qt::GridLayout();
    $validator2Layout->addWidget($validator2Label, 0, 0);
    $validator2Layout->addWidget(this->validator2LineEdit, 1, 0, 1, 2);
    $validator2Group->setLayout($validator2Layout);

    this->validator2LineEdit->setValidator(Qt::DoubleValidator(5,
            999.0, 2, this->validator2LineEdit));

    my $alignmentLayout = Qt::GridLayout();
    $alignmentLayout->addWidget($alignmentLabel, 0, 0);
    $alignmentLayout->addWidget($alignmentComboBox, 0, 1);
    $alignmentLayout->addWidget(this->alignmentLineEdit, 1, 0, 1, 2);
    $alignmentGroup->setLayout($alignmentLayout);

    my $accessLayout = Qt::GridLayout();
    $accessLayout->addWidget($accessLabel, 0, 0);
    $accessLayout->addWidget(this->accessLineEdit, 1, 0, 1, 2);
    $accessGroup->setLayout($accessLayout);
# [7]

# [8]
    my $layout = Qt::GridLayout();
    $layout->addWidget($validatorGroup, 0, 0);
    $layout->addWidget($validator2Group, 0, 1);
    $layout->addWidget($accessGroup, 0, 2);
    this->setLayout($layout);

    this->setWindowTitle(this->tr('Line Edits'));
}
# [8]

# [9]
sub echoChanged {
    my ($index) = @_;
    if ($index == 0) {
        this->echoLineEdit->setEchoMode(Qt::LineEdit::Normal());
    }
    elsif ( $index == 1 ) {
        this->echoLineEdit->setEchoMode(Qt::LineEdit::Password());
    }
    elsif ( $index == 2 ) {
    	this->echoLineEdit->setEchoMode(Qt::LineEdit::PasswordEchoOnEdit());
    }
    elsif ( $index == 3 ) {
        this->echoLineEdit->setEchoMode(Qt::LineEdit::NoEcho());
    }
}
# [9]

# [10]

# [11]
sub alignmentChanged {
    my ($index) = @_;
    if ( $index == 0 ) {
        this->alignmentLineEdit->setAlignment(Qt::AlignLeft());
    }
    elsif ( $index == 1 ) {
        this->alignmentLineEdit->setAlignment(Qt::AlignCenter());
    }
    elsif ( $index == 2 ) {
    	this->alignmentLineEdit->setAlignment(Qt::AlignRight());
    }
}
# [11]

# [13]
sub accessChanged {
    my ($index) = @_;
    if ( $index == 0 ) {
        this->accessLineEdit->setReadOnly(0);
    }
    elsif ( $index == 1 ) {
        this->accessLineEdit->setReadOnly(1);
    }
}
# [13]

1;
